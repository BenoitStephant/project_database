from flask_restful import Resource, reqparse
from database.database import connect_db, get_cursor
from api.service.auth_service import AuthService


class AuthController(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument("username", type=str, required=True, help="Can't be empty")
    parser.add_argument("password", type=str, required=True, help="Can't be empty")

    def register():
        data = AuthController.parser.parse_args()
        try:
            db = connect_db()
            cursor = get_cursor(db)
            cursor.callproc("get_user_by_name", args=(data.username,))
            result = cursor.fetchall()
            if result:
                return {"message": "User with this username is already register."}, 409
            return AuthService.register(data.username, data.password, db, cursor)
        except Exception as e:
            print(e)
        finally:
            cursor.close()
            db.close()

    def login():
        data = AuthController.parser.parse_args()
        try:
            db = connect_db()
            cursor = get_cursor(db)
            cursor.execute("call get_user_by_name(%s)", (data.username,))
            result = cursor.fetchall()
            if not result:
                return {"message": "Bad combinaison of password and username."}, 401
            return AuthService.login(data.username, data.password, result, db, cursor)
        except Exception as e:
            print(e)
        finally:
            cursor.close()
            db.close()
