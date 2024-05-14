person1 = input("Enter your name: ")
height1 = int(input("Enter your height: "))
person2 = input("Enter your name: ")
height2 = int(input("Enter your height: "))
if height1 > height2:
    print(f"{person1} is taller than {person2}")
elif height1 == height2:
    print(f"{person2} and {person1} are of same height")
else:
    print(f"{person2} is taller than {person1}")
