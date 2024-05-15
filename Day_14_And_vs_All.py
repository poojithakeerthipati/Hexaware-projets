print(all([True, False, True]))  # acts as And
print(any([True, False, True]))  # acts as or


def qualify(marks):
    result = all([mark >= 40 for mark in marks])
    if result:
        return "Yes, you will get a grade 🥳"
    return "No, you will not get a grade 😔"


marks = [50, 40, 20, 90]
print(qualify(marks))
