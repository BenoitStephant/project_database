from typing import final
from flask_restful import Resource, reqparse
from api.service.category_service import CategoryService

from database.database import connect_db, get_cursor


class CategoryController(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument("title", type=str, required=True, help="Can't be empty")
    parser.add_argument("description", type=str, required=True, help="Can't be empty")
    parser.add_argument("image_url", type=str, required=True, help="Can't be empty")

    def create():
        data = CategoryController.parser.parse_args()
        try:
            db = connect_db()
            cursor = get_cursor(db)
            return CategoryService.create(data.title, data.description, data.image_url, db, cursor)
        except Exception as e:
            print(e)
            return {"Error message": "Internal Error."}
        finally:
            cursor.close()
            db.close()

    # def find_all():
    #     try:
    #         db = connect_db()
    #         cursor = get_cursor(db)
    #         return ConceptService.find_all(db, cursor)
    #     except Exception as e:
    #         print(e)
    #         return {"Error message": "Internal Error."}
    #     finally:
    #         cursor.close()
    #         db.close()
