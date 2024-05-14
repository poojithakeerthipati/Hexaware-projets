# Idea
# Object Oriented Programming
# Modeling our problem as real-world objects

# Car
# What makes a car?
# 1. engine
# 2. wheels
# 3. name
# 4. doors


#  Car
# 1. engine - v8
# 2. wheels - 4
# 3. name - Ferrari
# 4. doors - 2


# 1. engine - v4
# 2. wheels - 4
# 3. name - Alto
# 4. doors - 4


#  Car -> blueprint | Class blueprint object


class Car:
    def __init__(
        self, name, engine, wheels, doors
    ):  # creating object calls init (constructor)
        # instance variable
        self.name = name
        self.engine = engine
        self.wheels = wheels
        self.doors = doors

    # instance method
    def horn(self):
        return f"{self.name} says Vroom Vroom"


ferrari = Car("Ferrari", "v8", 4, 2)  # object
alto = Car("Alto", "v4", 4, 4)  # object
mclaren = Car("mcLaren", "v8", 4, 2)
mercedes = Car("G-Wagon", "v8", 4, 5)

print(ferrari.name, ferrari.wheels)
print(alto.name, alto.engine)
print(ferrari.horn())
print(alto.horn())


class Bank_Account:
    interest_rate = 0.03

    def __init__(self, account_no, name, balance):
        self.account_no = account_no
        self.name = name
        self.balance = balance

    def Display_Balance(self):
        return f"{self.name}, Your balance is : ₹{self.balance:,}"

    def Withdraw(self, amount):
        if self.balance >= amount:
            self.balance -= amount
            return f"Success your Balance is {self.balance:,}"
        else:
            return f"Sorry, Not enough Balance"

    def Deposit(self, amount):
        if amount <= 0:
            return f"Sorry, Enter a valid amount"
        else:
            self.balance += amount
            return f"Success , You've successfully deposited the amount"

    def Apply_interest(self):
        Interest_amount = Bank_Account.interest_rate * self.balance
        self.balance += Interest_amount
        return f"Interest received {Interest_amount:,}"


Account_holder_1 = Bank_Account(738687747354, "Mark", 90_000)
Account_holder_2 = Bank_Account(475576345676, "Khloe", 2_10_000)
Account_holder_3 = Bank_Account(874587687557, "Ram", 18_50_900)

print(Account_holder_1.name)
print(Account_holder_1.Display_Balance())
print(Account_holder_1.Withdraw(10000))
print(Account_holder_2.Withdraw(20000))
print(Account_holder_1.Display_Balance())
print(Account_holder_2.Display_Balance())
print(Account_holder_1.Deposit(10810))
print(Account_holder_1.Display_Balance())
print(Account_holder_1.Apply_interest())
print(Account_holder_1.Display_Balance())


# class Circle:
#     pi = 3.14

#     def __init__(self, radius):
#         self.radius = radius

#     @staticmethod
#     def perimeter(radius):
#         return 2 * Circle.pi**radius

#     def Calculate_area(self):
#         return Circle.pi * self.radius**2


# circle1 = Circle(8)
# print(Circle.perimeter(4))
# print(circle1.Calculate_area())


class Circle:
    pi = 3.14

    def __init__(self, radius):
        self.radius = radius

    @staticmethod
    def perimeter(radius):
        return 2 * Circle.pi * radius

    @classmethod
    def from_diameter(cls, diameter):
        radius = diameter / 2
        return cls(radius)

    def calculate_area(self):
        return Circle.pi * self.radius**2


# Normal function but inside class | no access to self
print(Circle.perimeter(2))

# Instance method
circle1 = Circle(4)
print(circle1.calculate_area())


# Class method - to construct the object
circle_from_dia = Circle.from_diameter(10)
print(circle_from_dia.calculate_area())  # 78.5


# get_total_no_accounts(), update_interest_rate()


class Bank2:
    # Class variable | All your instance share the class variable
    _interest_rate = 0.02
    count = 0

    def __init__(self, acc_no, name, balance):
        # instance variable
        self.acc_no = acc_no
        self.name = name
        self.balance = balance
        Bank2.count += 1

    def display_balance(self):
        return f"Your balance is: ₹{self.balance:,}"

    def withdraw(self, amount):
        if self.balance - amount >= 0:
            self.balance -= amount
            return f"Success. {self.display_balance()}"
        else:
            return f"Insufficient funds. {self.display_balance()}"

    def deposit(self, amount):
        if amount >= 0:
            self.balance += amount
            return f"Success. {self.display_balance()}"
        else:
            return f"Invalid amount. {self.display_balance()}"

    def apply_interest(self):
        accumulated_interest_amt = self.balance * Bank2._interest_rate
        self.balance += accumulated_interest_amt
        return f"Interest received. ₹{accumulated_interest_amt}"

    @staticmethod
    def Get_total_no_of_accounts():
        return f"In total we have {Bank2.count} accounts"

    @classmethod
    def Update_interest_rate(cls, percent):
        cls._interest_rate = percent
        return f"Interest rate updated {cls._interest_rate}"


sneha = Bank2(128, "Sneha", 1_00_000)
siva = Bank2(129, "Siva", 90_000)


print(Bank2.Get_total_no_of_accounts())
print(Bank2.Update_interest_rate(0.10))

sneha.apply_interest()
sneha.display_balance()  # 110,000
print(sneha.display_balance())


class Animal:
    def __init__(self, name):
        self._name = name

    def speak(self):
        return "some sound"


class Dog(Animal):
    def __init__(self, name, speed):
        super().__init__(name)  # Base class Constructor
        self.__speed = speed

    def run(self):
        return "Wags tail"

    # Polymorphism : Method Overloading
    def speak(self):
        return "Woof Woof"

    def speed_bonus(self):
        return f"{self._name} Running at {self.__speed*2}Kmph"


toby = Animal("toby")
Maxy = Dog("Maxy", 20)
print(Maxy.speak())
print(Maxy._name)  # we can access it but cant able to modify
print(Maxy.run())
# print(Maxy.__speed)
print(Maxy.speed_bonus())
print(toby.speak())


class SavingsAccount(Bank2):
    _interest_rate = 0.05


class CurrentAccount(Bank2):
    transaction_fee = 10

    def withdraw(self, amount):
        total_amount = amount + CurrentAccount.transaction_fee
        return super().withdraw(total_amount)


ross = SavingsAccount(203, "ross", 10000)
# ross1 = Bank2(203, "ross1", 10000)
john = CurrentAccount(204, "john", 10_00_000)
# print(ross1.display_balance())
# print(ross1.apply_interest())
# print(ross1.display_balance())
print(ross.display_balance())
print(ross.apply_interest())
print(ross.display_balance())
print(john.withdraw(10_000))
print(john.withdraw(1000))
print(john.display_balance())


# class Bank:
#     # Class Variable
#     interest_rate = 0.05

#     def apply_interest(self):
#         interest = self.balance * self.interest_rate
#         self.balance += interest
#         print(f"An annual interest of ₹{interest:,} is applied to your account.")
#         print(self.display_balance())


# class SavingsAccount(Bank):
#     interest_rate = 0.05


# class CurrAccount(Bank):
#     def withdraw(self, amount):
#         return super().withdraw(amount + 10)


# sabesh = SavingsAccount("Sabesh", 131, 80_000)
# tanishq = CurrAccount("Tanishq", 134, 90_000)

# sabesh.apply_interest()
# sabesh.display_balance()

# print(tanishq.withdraw(1000))
# print(tanishq.withdraw(10000))
# print(tanishq.display_balance())
