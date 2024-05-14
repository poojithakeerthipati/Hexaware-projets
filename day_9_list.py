marks = [98, 75, 40, 80, 90, 45, 80, 60]  # list
print(type(marks))
print(len(marks))
print(marks[-1])
print(marks[:4])
for i in marks:
    print(i)

print(marks[::-1])
marks.append(78)
marks.insert(3, 65)
print(marks)


grocery_list1 = [1000, 1500, 400]
fruit_list2 = [2000, 50]
result = grocery_list1 + fruit_list2
print(result)

heights = [198, 175, 140, 1777]
heights.pop()
heights.remove(198)
print(heights)


# list are mutable whereas strings are immutable
price_list = [1000, 1500, 400]
price_list_copy = price_list  # copy by reference
price_list1 = [1000, 1500, 400]
print(price_list_copy.append(600))
print(price_list.append(700))
print(price_list1.append(800))
print(price_list, price_list_copy, price_list1)
print(id(price_list), id(price_list_copy), id(price_list1))

p1 = [1000, 1500, 400]
p2 = p1.copy()  # call by value
p3 = p1[::]
print(p1, p2, p3)
print(id(p1), id(p2), id(p3))

h1 = ["pooji"] * 3
print(h1)
