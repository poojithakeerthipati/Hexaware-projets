percent = int(input("Enter a number: "))
m = percent // 10
s = "=" * m
space = " " * (10 - m)
print(f"[{s}{space}]{percent}%")