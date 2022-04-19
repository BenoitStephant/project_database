from flask import jsonify


class CategoryService:
    def create(title, description, image_url, db, cursor):
        cursor.callproc("create_category", args=(title, description, image_url))
        return {"message": "Category Successfuly create"}

    def find_all(db, cursor):
        cursor.execute("SELECT * FROM Category");
        categories = []
        for row in cursor.fetchall():
            categories.append(
                {
                    "id": row[0],
                    "name": row[1],
                    "description": row[2],
                    "image_url": row[3],
                    "created_at": row[4],
                    "updated_at": row[5]
                })
        return jsonify(categories=categories)
