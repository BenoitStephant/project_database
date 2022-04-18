from database.database import connect_db, get_cursor

import hashlib
import time


class AuthService:
    def register(username, password, db, cursor):
        cursor.execute("SELECT * FROM User WHERE username=%s", (username,))
        result = cursor.fetchall()
        if result:
            return {"message": "User with this username is already register."}, 409
        hash_password = hashlib.md5(password.encode("utf-8")).hexdigest()
        date_now = time.strftime("%Y-%m-%d %H:%M:%S")
        cursor.execute(
            "INSERT INTO User (id, username, password) VALUES (%s, %s, %s)",
            (
                0,
                username,
                hash_password,
            ),
        )
        db.commit()
        return {"message": "User successfully created."}, 201
