from distutils.log import debug
from sqlite3 import connect
from flask import Flask
import os
from os.path import join, dirname
from dotenv import load_dotenv
from database.database import get_db, init_db

dotenv_path = join(dirname(__file__), '.env')
load_dotenv(dotenv_path)

app = Flask(__name__)

db = get_db()
with app.app_context():
    init_db(db)


@app.route('/')
def index() -> str:
    return "I'm alive !"


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
