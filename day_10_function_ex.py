library_list = [
    {
        "title": "Python Programming",
        "author": "Eric Matthes",
        "year": 2019,
        "available": True,
    },
    {
        "title": "Automate the Boring Stuff with Python",
        "author": "Al Sweigart",
        "year": 2020,
        "available": True,
    },
    {
        "title": "Learning Python I",
        "author": "Mark Lutz",
        "year": 2013,
        "available": False,
    },
    {
        "title": "Fluent Python",
        "author": "Luciano Ramalho",
        "year": 2015,
        "available": True,
    },
    {
        "title": "Adavance Python",
        "author": "Mark Lutz",
        "year": 2015,
        "available": False,
    },
]
# book = {"title": "Fluent Python II", "author": "Alex", "year": 2016, "available": True}


# def add_Book(library, new_book):
#     return library.append(new_book)


# add_Book(library_list, book)
# print(library_list)

# # Task 2
# # Search Books by Author Function: Write a function search_by_author(library, author_name)

# # def search_by_author(library, author_name):
# # for book in library_list:
# #     if book["author"] == author_name:
# #         book_by_author.append(book)
# # return book_by_author


# def search_by_author(library, author_name):
#     book_by_author = [book for book in library_list if book["author"] == author_name]
#     return book_by_author


# print(search_by_author(library_list, "Mark Lutz"))


# Task 3
# Check Out Book Function: Write a function check_out_book(library, title) that
# marks a book as not available if it exists and is available in the library.


# def check_out_book(library, title):
#     found_flag = False
#     for book in library:
#         if book["title"] == title and book["available"] == True:
#             found_flag = True
#             book["available"] = False
#             return f"{title} is available and checked out successfully"
#         elif book["title"] == title and book["available"] == False:
#             found_flag = True
#             return f"Sorry , {title} is unavailable Now"
#     if found_flag == False:
#         return f"{title} does not exists in the library"


# print(check_out_book(library_list, "Fluent Python"))
# print(check_out_book(library_list, "Fluent"))


def check_out_book(library, title):
    for book in library:
        if book["title"] == title and book["available"] == True:
            book["available"] = False
            return f"{title} is available and checked out successfully"
        elif book["title"] == title and book["available"] == False:
            return f"Sorry , {title} is unavailable Now"
    return f"{title} does not exists in the library"


print(check_out_book(library_list, "Fluent Python"))
print(check_out_book(library_list, "Fluent"))


a = (1, 2, 3, 4, 15, 58, 443, -343, -98)
print(sum(a))
print(max(a))
print(min(a))
print(len(a))

print(max("fhbvjsfvjsbb"))
print(min("fhbvjsfvjsbb"))


# Import package - Inbuilt
# from package_name import function_name
from pprint import pprint

movies = [
    {"title": "Inception", "ratings": [5, 4, 5, 4, 5]},
    {"title": "Interstellar", "ratings": [5, 5, 4, 5, 4]},
    {"title": "Dunkirk", "ratings": [4, 4, 4, 3, 4]},
    {"title": "The Dark Knight", "ratings": [5, 5, 5, 5, 5]},
    {"title": "Memento", "ratings": [4, 5, 4, 5, 4]},
]


# def average_rating(movies):
#     for movie in movies:
#         movie["avg_rating"] = sum(movie["ratings"]) / len(movie["ratings"])
#     return movies


# print(average_rating(movies))


def average_rating(movies):
    for movie in movies:
        movie["avg_rating"] = average(movie)
    return movies


def average(movie):
    return sum(movie["ratings"]) / len(movie["ratings"])


pprint(average_rating(movies))


# implementation of max function
def own_max(*nums):
    curr_max = nums[0]
    for n in nums:
        if curr_max < n:
            curr_max = n
    return curr_max


print(own_max(5, 6, 10))
print(own_max(5, 6, 10, 7, 80, 60))
