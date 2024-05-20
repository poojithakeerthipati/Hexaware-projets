from pprint import pprint

classes = {
    "Class A": [
        {"name": "Alice", "grades": [82, 90, 88]},
        {"name": "Bob", "grades": [78, 81, 86]},
        {"name": "Charlie", "grades": [85, 85, 87]},
        {"name": "Alex", "grades": [85, 90, 87]},
    ],
    "Class B": [
        {"name": "Dave", "grades": [92, 93, 88]},
        {"name": "Eve", "grades": [76, 88, 91]},
        {"name": "Frank", "grades": [88, 90, 92]},
    ],
}


# Task 1: Find average of each student
# output = {
#     "Class A": {"Alice": 90.50, "Bob": 84.50, "Charlie": 90.00},
#     "Class B": {"Dave": 92.50, "Eve": 86.50, "Frank": 950},
# }


# average_marks = {
#     student["grades"]: round(sum(student["grades"]) / len(student["grades"]), 2)
#     for student in students
# }
# def calculate_student_avg(classes):
#     result = {}
#     for class_name, students in classes.items():
#         # print(class_name)
#         # print(students)
#         class_student_avg = {}
#         total_marks = []
#         final_result = {}
#         count = 0
#         for student in students:
#             average_grade = sum(student["grades"]) / len(student["grades"])
#             total_marks.append(round(average_grade, 2))
#             count += 1
#             class_student_avg[student["name"]] = round(average_grade, 2)
#             result[class_name] = class_student_avg
#         final_result[class_name] = round(sum(total_marks) / count, 2)
#         print(final_result)
#     return result


# pprint(calculate_student_avg(classes))


def find_avg(items):
    return round(sum(items) / len(items), 2)


# result = {}
# for class_name, students in classes.items():
#     student_average = {}
#     for student in students:
#         average_grade = find_avg(student["grades"])
#         student_average[student["name"]] = average_grade
#     result[class_name] = student_average

# pprint(result)

# result = {}
# for class_name, students in classes.items():
#     student_average = {
#         student["name"]: find_avg(student["grades"]) for student in students
#     }
#     result[class_name] = student_average
# pprint(result)


# class_avg = {}
# for class_name, students in classes.items():
#     class_student_avg = [find_avg(student["grades"]) for student in students]
#     class_avg[class_name] = find_avg(class_student_avg)
# print(class_avg)

# class_avg = {
#     class_name: find_avg([find_avg(student["grades"]) for student in students])
#     for class_name, students in classes.items()
# }

# print(class_avg)


result = {}
for class_name, students in classes.items():
    student_average = {
        student["name"]: find_avg(student["grades"]) for student in students
    }
    result[class_name] = student_average

pprint(result)
