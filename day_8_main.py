# print("Hello, world!")
# #Declare and Assign Variables
# # name = "John Doe"
# # age = 30
# # height = 5.11
# # is_adult = True

# name = input("Enter your name:")
# print(name)
# print(type(name))
# print("Hello my name is " + name);

# temparature = float(input("Enter the temparature in Fahrenheit:"))
# Celsius = round((int(temparature) - 32) * 5/9)
# # print("The equivalent of "+str(temparature)+"°F is "+str(round(Celsius))+"°C")

# print(f"The equivalent of {temparature} °F is {Celsius}°C")

# Year_of_born = int(input("Enter your birth year: "))
# # result = 2024 - Year_of_born
# print(f"Your Current age is {2024 - Year_of_born}")

# n = int(input("Enter a number: "))
# for i in range(n):
#   print(n**i)

# print area of the circle

# radius = float(input("Enter the radius of the circle: "))
# area = 3.14 * radius**2
# print(f"The area of the circle is {area}")

percent = int(input("Enter a number: "))
m = percent // 10
s = "=" * m
space = " " * (10 - m)
print(f"[{s}{space}]{percent}%")
