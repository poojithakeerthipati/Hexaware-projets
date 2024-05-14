# Tuple


# Tuple - Immutable
person_list = ["Sanjana", "India", 20]
person = ("Sanjana", "India", 20, 20)

print(person[0], person[2])

# person_list[0] = "Sneha"
# person[0] = "Sneha"  # ❌
print(person[0], person[2])

# Modification is not allowed
# List vs Tuples
# Remove -> .pop(), .remove()  - ❌
# Add -> .append() , .insert() - ❌

# Methods
print(person.count(20))  # 2
print(person.index("India"))  # 1

# index vs find
# index - error if not found | find - -1  if not found
