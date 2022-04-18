from sqlite3 import Cursor
from flask import Flask
from flask_restful import Resource, reqparse
from database.database import connect_db, get_cursor
from api.controller.auth_controller import AuthController


class UserRegister(Resource):
    def post(self):
        return AuthController.register()


class UserLogin(Resource):
    def post(self):
        return AuthController.login()