from typing import final
from flask_restful import Resource, reqparse
from api.service.concept_service import ConceptService

from database.database import connect_db, get_cursor


class ConceptController(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument("name", type=str, required=True, help="Can't be empty")

    def create():
        data = ConceptController.parser.parse_args()
        try:
            db = connect_db()
            cursor = get_cursor(db)
            return ConceptService.create(data.name, db, cursor)
        except Exception as e:
            print(e)
            return {"Error message": "Internal Error."}
        finally:
            cursor.close()
            db.close()

    def find_all():
        try:
            db = connect_db()
            cursor = get_cursor(db)
            return ConceptService.find_all(db, cursor)
        except Exception as e:
            print(e)
            return {"Error message": "Internal Error."}
        finally:
            cursor.close()
            db.close()
