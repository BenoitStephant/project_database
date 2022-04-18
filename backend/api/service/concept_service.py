class ConceptService:
    def create(name, db, cursor):
        cursor.callproc("create_concept", args=(name,))
        return {"message": "Concept Successfuly create"}

    def find_all(db, cursor):
        cursor.execute("SELECT * FROM Concept")
        concepts = []
        for row in cursor.fetchall():
            print(row[0])
            concepts.append({"id": str(row[0]), "name": row[1], "created_at": str(row[2])})
        return concepts
