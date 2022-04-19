from flask import jsonify
from flask_jwt_extended import get_jwt_identity


class UserService:
    def get(user_id, db, cursor):
        cursor.execute("SELECT * FROM User WHERE User.id=%s", (user_id,))
        result = cursor.fetchall()[0]
        if not result:
            return {"Error Message": "Can't find user with id."}
        jwt_user_id = get_jwt_identity()["id"]
        user = {
            "id": result[0],
            "username": result[1],
            "match_played": result[3],
            "average": result[4],
            "favorite_category_id": result[5],
            "created_at": result[8],
            "updated_at": result[9],
        }
        if jwt_user_id != user_id:
            if result[6] == 0:
                del user["match_played"]
            if result[7] == 0:
                del user["favorite_category_id"]
        return jsonify(user=user)

    def change_privacy(favorite_category_id, match_played, db, cursor):
        jwt_user_id = get_jwt_identity()["id"]
        cursor.callproc(
            "set_privacy",
            (
                jwt_user_id,
                match_played,
                favorite_category_id,
            ),
        )
        db.commit()
        return {"Message": "Change Privacy Success."}
