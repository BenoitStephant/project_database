from flask_restful import Resource
from flask_jwt_extended import jwt_required
from api.controller.user_controller import UserController


class User(Resource):
    @jwt_required()
    def get(self):
        return UserController.get()


class UserPrivacy(Resource):
    @jwt_required()
    def post(self):
        return UserController.change_privacy()
