import uuid
from database.database import connect_db, get_cursor
from flask_jwt_extended import create_access_token, jwt_required
from flask import jsonify

import hashlib


class AuthService:
    def register(username, password, db, cursor):
        hash_password = hashlib.md5(password.encode("utf-8")).hexdigest()
        user_id = str(uuid.uuid4())
        cursor.execute(
            "INSERT INTO User (id, username, password) VALUES (%s, %s, %s)",
            (
                user_id,
                username,
                hash_password,
            ),
        )
        db.commit()
        return {"message": "User successfully created."}, 201

    def login(username, password, user, db, cursor):
        hash_password_request = hashlib.md5(password.encode("utf-8")).hexdigest()
        hash_password_db = user[0][2]
        if hash_password_request != hash_password_db:
            return {"message": "Bad combinaison of password and username."}, 401
        user = {
            "id": user[0][0],
            "username": user[0][1],
            "match_nb": user[0][3],
            "average": user[0][4],
            "favorite_category_id": user[0][5],
            "created_at": user[0][6],
            "updated_at": user[0][7],
        }
        access_token = create_access_token({"id": user["id"], "username": user["username"]})
        return jsonify(user=user, access_token=access_token)
