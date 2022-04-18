from flask_restful import Resource, reqparse
from api.service.match_service import MatchService

from database.database import connect_db, get_cursor


class MatchController(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument("category_id", type=str, location="args")

    def get():
        data = MatchController.parser.parse_args()
        try:
            db = connect_db()
            cursor = get_cursor(db)
            return MatchService.get(data.category_id, db, cursor)
        except Exception as e:
            print(e)
            return {"Error message": "Internal Error."}
        finally:
            cursor.close()
            db.close()
