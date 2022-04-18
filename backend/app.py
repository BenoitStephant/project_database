import os

from distutils.log import debug
from sqlite3 import connect
from flask import Flask
from flask_restful import Api
from flask_jwt_extended import JWTManager
from os.path import join, dirname
from dotenv import load_dotenv
from database.database import init_db, indexes_db, porocedures_db, elo_db, training_set_db
from flask_cors import CORS

from api.routes.auth_routes import UserRegister, UserLogin
from api.routes.concept_routes import Concept
from api.routes.category_routes import Category
from api.routes.match_routes import Match

dotenv_path = join(dirname(__file__), ".env")
load_dotenv(dotenv_path)

app = Flask(__name__)
app.config["JSON_SORT_KEYS"] = False
app.config["JWT_SECRET_KEY"] = os.environ.get("JWT_SECRET")
jwt = JWTManager(app)
api = Api(app)
CORS(app, supports_credentials=True)

with app.app_context():
    init_db()
    indexes_db()
    porocedures_db()
    elo_db()
    training_set_db()


@app.route("/health")
def index() -> str:
    return "I'm alive !"


api.add_resource(UserRegister, "/register")
api.add_resource(UserLogin, "/login")
api.add_resource(Concept, "/concepts")
api.add_resource(Category, "/categories")
api.add_resource(Match, "/match")

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
