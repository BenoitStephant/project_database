from flask_restful import Resource
from api.controller.concept_controller import ConceptController
from flask_jwt_extended import jwt_required


class Concept(Resource):
    @jwt_required()
    def post(self):
        return ConceptController.create()

    @jwt_required()
    def get(self):
        return ConceptController.find_all()
