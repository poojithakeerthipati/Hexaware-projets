```python
marks = [98, 75, 40, 80, 90, 45, 80, 60]  # list or array # list of integers
 
print(type(marks))
print(len(marks))
 
# index: Accessing values
print(marks[0])
print(marks[-1])
 
 
# Slicing operator
# First four values
print(marks[0:4])  # [98, 75, 40, 80]
print(marks[:4])  # [98, 75, 40, 80]
 
# Reverse the list
print(marks[::-1])  # [60, 80, 45, 90, 80, 40, 75, 98]
 
# Why? Store multiple values in a variable
 
# list of lists
marks = [98, 75, 40, 80, 90, 45, 80, 60]
marks.append(78)  # [98, 75, 40, 80, 90, 45, 80, 60, 78] # adds value at the end
print(marks)
 
# Add 65 after 40
sci = 65
marks.insert(3, sci)
print(marks)
 
grocery_list = [1000, 1500, 400]
fruits_list = [2000, 500]
 
 
# Combine two list
# [1000, 1500, 400, 2000, 500]
final_purchase_list = grocery_list + fruits_list
print(final_purchase_list)
 
heights = [198, 175, 140, 1777]
heights.pop(1)
print(heights)
 
heights[0] = 200
print(heights)  # List are Mutable
 
 
price_list = [1000, 1500, 400]
price_list_copy = price_list  # Copy by reference
price_list1 = [1000, 1500, 400]
 
price_list_copy.append(600)
price_list.append(700)
price_list1.append(800)
 
print(price_list, price_list_copy, price_list1)
print(id(price_list), id(price_list_copy), id(price_list1))  # id -> address
 
p1 = [1000, 1500, 400]
p2 = p1.copy()  # Copy by value
p3 = p1[:]
 
print(p1, p2, p3)
print(id(p1), id(p2), id(p3))
 
# Copy by reference
# p2 = p1
# Copy by value
# p2 = p1.copy()
# p3 = p1[:]
 
 
# Remove -> .pop(), .remove()
# Add -> .append() , .insert()
# Copy -> : (slice), copy
 
h1 = [198, 175, 140, 1777]
# h1.pop(1)
h1.remove(1777)  # pop - index | remove - value
print(h1)
 
# Repetition
cloned_treasures = ["Gold Coin"] * 3
print(cloned_treasures)
 
 
# split (str -> list) vs join (list -> str)
shop_stock = "vanilla,lime,chocolate"
shop_stock_list = shop_stock.split(",")
 
print(shop_stock_list, shop_stock_list[2])
 
avatar = ["Fire", "Water", "Earth", "Air"]
 
print(",".join(avatar))
print("|".join(avatar))
```