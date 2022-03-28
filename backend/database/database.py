import os
import click
from flask import current_app
from os.path import join, dirname
from dotenv import load_dotenv
import mysql.connector

dotenv_path = join(dirname(__file__), '../.env')
load_dotenv(dotenv_path)


def get_db():
    print("Conneting to MySql database........")
    config = {
        'user': os.environ.get("DB_USER"),
        'password': os.environ.get("DB_PASSWORD"),
        'host': os.environ.get("DB_HOST"),
        'port': os.environ.get("DB_PORT"),
        'database': os.environ.get("DB_NAME")
    }
    db = mysql.connector.connect(**config)
    return db


def init_db(db):
    print("Init database........")
    with current_app.open_resource('database/init.sql') as f:
        for _ in db.cursor().execute(f.read().decode('utf8'), multi=True):
            pass


def close_db(db):
    if db is not None:
        db.close()
