from flask_restful import Resource
from api.controller.auth_controller import AuthController


class UserRegister(Resource):
    def post(self):
        return AuthController.register()


class UserLogin(Resource):
    def post(self):
        return AuthController.login()
