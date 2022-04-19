from flask import jsonify


class ItemService:
    def get(category_id, page_limit, reversed, page, db, cursor):
        cursor.callproc(
            "query_item_elo",
            (
                category_id,
                page,
                page_limit,
                reversed,
            ),
        )
        for result in cursor.stored_results():
            rows = result.fetchall()
        items = []
        for row in rows:
            items.append(
                {
                    "id": row[0],
                    "name": row[1],
                    "description": row[2],
                    "image_url": row[3],
                    "concept": row[5],
                    "elo": str(row[6]),
                }
            )
        return jsonify(items=items)
