from flask_restful import Resource
from api.controller.category_controller import CategoryController
from flask_jwt_extended import jwt_required


class Category(Resource):
    @jwt_required()
    def post(self):
        return CategoryController.create()

    # @jwt_required()
    # def get(self):
    #     return ConceptController.find_all()
