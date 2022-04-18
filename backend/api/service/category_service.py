class CategoryService:
    def create(title, description, image_url, db, cursor):
        cursor.callproc("create_category", args=(title, description, image_url))
        return {"message": "Category Successfuly create"}

    def find_all(db, cursor):
        cursor.execute("call get_concepts()")
        concepts = []
        for row in cursor.fetchall():
            print(row[0])
            concepts.append({"id": str(row[0]), "name": row[1], "created_at": str(row[2])})
        return concepts
