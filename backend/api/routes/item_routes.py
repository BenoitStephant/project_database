from flask_restful import Resource
from api.controller.item_controller import ItemController


class Item(Resource):
    def get(self):
        return ItemController.get()
