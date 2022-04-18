from flask import jsonify


class MatchService:
    def get(category_id, db, cursor):
        if not category_id:
            cursor.callproc("pick_random_category")
            for result in cursor.stored_results():
                category = result.fetchall()[0]
        else:
            cursor.execute("SELECT * FROM Category WHERE id=%s", (category_id,))
            category = cursor.fetchall()[0]
        category = {
            "id": category[0],
            "title": category[1],
            "description": category[2],
            "image_url": category[3],
            "created_at": category[4],
            "updated_at": category[5],
        }
        cursor.callproc("pick_concept_from_category", (category["id"],))
        for result in cursor.stored_results():
            concept = result.fetchall()[0]
        concept = {"id": concept[0], "name": concept[1], "created_at": concept[2]}
        cursor.callproc("pick_two_items_from_category", (category["id"],))
        for result in cursor.stored_results():
            items = result.fetchall()
        items = [
            {
                "id": items[0][0],
                "name": items[0][2],
                "description": items[0][3],
                "image_url": items[0][4],
                "created_at": items[0][5],
            },
            {
                "id": items[1][0],
                "name": items[1][2],
                "description": items[1][3],
                "image_url": items[1][4],
                "created_at": items[1][5],
            },
        ]
        return jsonify(category=category, concept=concept, items=items)
