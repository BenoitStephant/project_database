from flask_restful import Resource, reqparse
from api.service.user_service import UserService

from database.database import connect_db, get_cursor


class UserController(Resource):
    parser_get = reqparse.RequestParser()
    parser_get.add_argument("user_id", type=str, required=True, help="Can't be empty", location="args")

    parser_change_privacy = reqparse.RequestParser()
    parser_change_privacy.add_argument("favorite_category_id", type=str, required=True, help="Can't be empty")
    parser_change_privacy.add_argument("visible_match", type=str, required=True, help="Can't be empty")

    parser_get_match = reqparse.RequestParser()
    parser_get_match.add_argument("page_limit", type=int, default=20)
    parser_get_match.add_argument("page", type=int, default=0)

    def get():
        data = UserController.parser_get.parse_args()
        try:
            db = connect_db()
            cursor = get_cursor(db)
            return UserService.get(data.user_id, db, cursor)
        except Exception as e:
            print(e)
            return {"Error message": "Internal Error."}
        finally:
            cursor.close()
            db.close()

    def get_match():
        data = UserController.parser_get_match.parse_args()
        try:
            db = connect_db()
            cursor = get_cursor(db)
            return UserService.get_match(data.page_limit, data.page, db, cursor)
        except Exception as e:
            print(e)
            return {"Error message": "Internal Error."}
        finally:
            cursor.close()
            db.close()

    def change_privacy():
        data = UserController.parser_change_privacy.parse_args()
        if not any(x in data.favorite_category_id for x in ["1", "0"]):
            return {"Error message": "need to give 1 or 0 for attribut value"}, 422
        if not any(x in data.visible_match for x in ["1", "0"]):
            return {"Error message": "need to give 1 or 0 for attribut value"}, 422
        try:
            db = connect_db()
            cursor = get_cursor(db)
            return UserService.change_privacy(data.favorite_category_id, data.visible_match, db, cursor)
        except Exception as e:
            print(e)
            return {"Error message": "Internal Error."}
        finally:
            cursor.close()
            db.close()
