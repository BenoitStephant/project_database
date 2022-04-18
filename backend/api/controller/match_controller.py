from flask_restful import Resource, reqparse
from api.service.match_service import MatchService

from database.database import connect_db, get_cursor


class MatchController(Resource):
    parser_get = reqparse.RequestParser()
    parser_get.add_argument("category_id", type=str, location="args")

    parser_match_log = reqparse.RequestParser()
    parser_match_log.add_argument("user_id", type=str, required=True, help="Can't be empty")
    parser_match_log.add_argument("category_id", type=str, required=True, help="Can't be empty")
    parser_match_log.add_argument("concept_id", type=str, required=True, help="Can't be empty")
    parser_match_log.add_argument("item_0_id", type=str, required=True, help="Can't be empty")
    parser_match_log.add_argument("item_1_id", type=str, required=True, help="Can't be empty")
    parser_match_log.add_argument("winner", type=str, required=True, help="Can't be empty")

    def get():
        data = MatchController.parser_get.parse_args()
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

    def match_log():
        data = MatchController.parser_match_log.parse_args()
        try:
            db = connect_db()
            cursor = get_cursor(db)
            return MatchService.match_log(
                data.category_id, data.concept_id, data.item_0_id, data.item_1_id, data.winner, data.user_id, db, cursor
            )
        except Exception as e:
            print(e)
            return {"Error Message": "Internale Error."}
        finally:
            cursor.close()
            db.close()
