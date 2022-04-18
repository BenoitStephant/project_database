from flask_restful import Resource, reqparse
from database.database import connect_db, get_cursor
from api.service.auth_service import AuthService


class AuthController(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument("username", type=str, required=True, help="Can't be empty")
    parser.add_argument("password", type=str, required=True, help="Can't be empty")

    def register():
        print()
        data = AuthController.parser.parse_args()
        try:
            db = connect_db()
            cursor = get_cursor(db)
            cursor.execute("SELECT * FROM User WHERE username=%s", (data.username,))
            result = cursor.fetchall()
            if result:
                return {"message": "User with this username is already register."}, 409
            return AuthService.register(data.username, data.password, db, cursor)
        except Exception as e:
            print(e)
        finally:
            cursor.close()
            db.close()
