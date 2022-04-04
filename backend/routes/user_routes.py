from sqlite3 import Cursor
from flask import Flask
from flask import jsonify
from flask_restful import Resource, reqparse
from flask_jwt_extended import create_access_token, jwt_required
from database.database import connect_db, get_cursor
import uuid
import hashlib
import time
import json


class UserRegister(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument("username", type=str, required=True, help="Can't be empty")
    parser.add_argument("password", type=str, required=True, help="Can't be empty")

    def post(self):
        data = UserRegister.parser.parse_args()
        try:
            db = connect_db()
            cursor = get_cursor(db)
            cursor.execute("SELECT * FROM User WHERE name=%s", (data.username,))
            result = cursor.fetchall()
            if result:
                return {"message": "User with this username is already register."}, 409
            id = str(uuid.uuid4())
            hash_password = hashlib.md5(data.password.encode("utf-8")).hexdigest()
            date_now = time.strftime("%Y-%m-%d %H:%M:%S")
            cursor.execute(
                "INSERT INTO User (id, name, password) VALUES (%s, %s, %s)",
                (
                    id,
                    data.username,
                    hash_password,
                ),
            )
            db.commit()
            return {"message": "User successfully created."}, 201
        except Exception as e:
            print(e)
        finally:
            cursor.close()
            db.close()


class UserLogin(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument("username", type=str, required=True, help="Can't be empty")
    parser.add_argument("password", type=str, required=True, help="Can't be empty")

    def post(self):
        data = UserRegister.parser.parse_args()
        try:
            db = connect_db()
            cursor = get_cursor(db)
            cursor.execute("SELECT * FROM User WHERE name=%s", (data.username,))
            result = cursor.fetchall()
            if not result:
                return {"message": "Bad combinaison of password and username."}, 401
            hash_password_request = hashlib.md5(data.password.encode("utf-8")).hexdigest()
            hash_password_db = result[0][2]
            if hash_password_request != hash_password_db:
                return {"message": "Bad combinaison of password and username."}, 401
            user = {
                "id": result[0][0],
                "name": result[0][1],
                "match_nb": str(result[0][3]),
                "average": str(result[0][4]),
                "favorite_category_id": result[0][5],
                "created_at": result[0][6],
                "updated_at": result[0][7],
            }
            access_token = create_access_token({"id": user["id"], "name": user["name"]})
            return jsonify(user=user, access_token=access_token)
        except Exception as e:
            print(e)
        finally:
            cursor.close()
            db.close()
