employees = [
    {"name": "Sneha", "experience": 2},
    {"name": "Manju"},
    {"name": "Sai Subash", "experience": 4},
    {"name": "Manasa"},
]


# Task: After 1 experience
for employee in employees:
    employee["experience"] = employee.get("experience", 0) + 1
print(employees)


# # Output
# [
#     {"name": "Sneha", "experience": 3},
#     {"name": "Manju",  "experience": 1},
#     {"name": "Sai Subash", "experience": 5},
#     {"name": "Manasa", "experience": 1},
# ]

# Task 2
#  Senior 5 or more, Mid-Level 3 to 5, Junior < 3
# Output
# [
#     {"name": "Sneha", "experience": 3, "status": "Mid-Level"},
#     {"name": "Manju", "experience": 1, "status": "Junior"},
#     {"name": "Sai Subash", "experience": 5, "status": "Senior"},
#     {"name": "Manasa", "experience": 1, "status": "Junior"},
# ]

for employee in employees:
    if employee["experience"] < 3:
        employee["status"] = employee.get("status", "Junior")
    elif employee["experience"] >= 5:
        employee["status"] = employee.get("status", "Senior")
    else:
        employee["status"] = employee.get("status", "Mid-Level")
print(employees)


t1, t2, *_, t3 = (100, 200, 300, 400, 60, 40, 30)
print(t1, t2, t3)

marks1 = [70, 80, 60]
marks2 = [*marks1, 75, 68]
print(marks2)


t1 = [80, 90]
t2 = [50, 60]
t3 = [*t1, *t2]
print(t3)


# Unpacking -> ** Dict
movie = {"name": "John wick", "year": 2014}

# Copy
mv1 = {**movie, "actor": "Keanu Reeves"}
mv2 = {**movie, "actor": "Keanu Reeves", "year": 2015}
mv3 = {"actor": "Keanu Reeves", "year": 2015, **movie}
print(mv1)
print(mv2)
print(mv3)
print(movie)
