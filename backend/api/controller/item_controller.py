from flask_restful import Resource, reqparse
from api.service.item_service import ItemService

from database.database import connect_db, get_cursor


class ItemController(Resource):

    parser_get = reqparse.RequestParser()
    parser_get.add_argument("category_id", type=str, required=True, help="Can't be empty")
    parser_get.add_argument("page_limit", type=str, default=20)
    parser_get.add_argument("reversed", type=str, default=0)
    parser_get.add_argument("page", type=str, default=0)

    def get():
        data = ItemController.parser_get.parse_args()
        try:
            db = connect_db()
            cursor = get_cursor(db)
            return ItemService.get(data.category_id, data.page_limit, data.reversed, data.page, db, cursor)
        except Exception as e:
            print(e)
            return {"Error message": "Internal Error."}
        finally:
            cursor.close()
            db.close()
