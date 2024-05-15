from abc import ABC, abstractmethod


# Abstract class /Interface
class Animal(ABC):
    @abstractmethod
    def make_sound(self):
        pass

    @abstractmethod
    def move(self):
        pass


class Dog(Animal):
    def make_sound(self):
        print("Woof Woof")

    def move(self):
        print("Running...🐕")

    def jump(self):
        print("Jumps 🦘")


maxy = Dog()
maxy.move()


class Bird(Animal):
    def make_sound(self):
        print("Tweet Tweet ")

    def move(self):
        print("Flying 🕊️")

    def eat(self):
        print("Chirping 🍴")


Sparrow = Bird()
Sparrow.make_sound()
Sparrow.eat()
Sparrow.move()
