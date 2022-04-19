from flask_restful import Resource
from api.controller.category_controller import CategoryController
from flask_jwt_extended import jwt_required


class Category(Resource):
    def post(self):
        return CategoryController.create()

    def get(self):
        return CategoryController.find_all()
