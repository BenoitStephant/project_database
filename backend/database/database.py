import os
from sqlite3 import Cursor, connect
import click
from flask import current_app
from os.path import join, dirname
from dotenv import load_dotenv
import mysql.connector

dotenv_path = join(dirname(__file__), "../.env")
load_dotenv(dotenv_path)


config = {
    "user": os.environ.get("DB_USER"),
    "password": os.environ.get("DB_PASSWORD"),
    "host": os.environ.get("DB_HOST"),
    "port": os.environ.get("DB_PORT"),
    "database": os.environ.get("DB_NAME"),
}


def connect_db():
    return mysql.connector.connect(**config)


def get_cursor(db):
    return db.cursor()


def init_db():
    print("Init database........")
    db = connect_db()
    cursor = get_cursor(db)
    with current_app.open_resource("database/init.sql") as f:
        for _ in cursor.execute(f.read().decode("utf8"), multi=True):
            pass
    cursor.close()
    db.close()
