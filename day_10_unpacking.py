# Multiple variable Assignment
import math

a = b = c = 10
print(a, b, c)


# unpacking

t1, t2, t3, _ = [100, 200, 300, 400]
print(t1, t2, t3)


t1, t2, *t3 = (100, 200, 300, 50, 60, 70, 80)
print(t1, t2, t3)


# for coordinate in coordinates:
#     distance.append((math.sqrt(coordinate[0] ** 2 + coordinate[1] ** 2)))
# print(distance)


# for loop+unpacking

# distance = []
# for coordinate in coordinates:
#     x, y = coordinate
#     distance.append(math.sqrt(x**2 + y**2))
# print(distance)


# unpacking + list comprehension
coordinates = [(5, 4), (1, 1), (6, 10), (9, 10)]
distance = [round(math.sqrt(x**2 + y**2), 2) for x, y in coordinates]
print(distance)
