from flask_restful import Resource
from api.controller.match_controller import MatchController
from flask_jwt_extended import jwt_required


class Match(Resource):
    @jwt_required()
    def get(self):
        return MatchController.get()
