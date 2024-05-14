books = [
    {"title": "Infinite Jest", "rating": 4.5, "genre": "Fiction"},
    {"title": "The Catcher in the Rye", "rating": 3.9, "genre": "Fiction"},
    {"title": "Sapiens", "rating": 4.9, "genre": "History"},
    {"title": "A Brief History of Time", "rating": 4.8, "genre": "Science"},
    {"title": "Clean Code", "rating": 4.7, "genre": "Technology"},
]


# task-1
highly_rated_books = []
for book in books:
    if book["rating"] >= 4.7:
        highly_rated_books.append(book["title"])
print(highly_rated_books)


# Task-2

highly_rated_books1 = [book["title"] for book in books if book["rating"] >= 4.7]
print(highly_rated_books1)


person = {
    "name": "Lionel Messi",
    "age": 36,
    "address": {
        "city": "rosario",
        "country": "Argentina",
    },
    "sport": "football",
}

print(person["address"]["city"])

# print(person["stats"])  # wrong

print(person.get("stats"))
print(person.get("name"))

person = {
    "name": "Lionel Messi",
    "age": 36,
    "address": {
        "city": "rosario",
        "country": "Argentina",
    },
    # "stats": {"goals": 300, "assists": 500},
    "sport": "football",
    # "height": 168,
}

# print(person["stats"]["goals"]) # KeyError: 'stats'
# print(person.get("stats").get("goals")) # 'NoneType' object has no attribute 'get'

# Default value - person.get(key, default value)
print(person.get("height", 174))

print(person.get("stats", {"goals": 106}).get("goals"))
