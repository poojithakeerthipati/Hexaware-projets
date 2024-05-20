colors = ["red", "blue", "red", "green", "pink", "blue"]

unique_colors = set()
for color in colors:
    unique_colors.add(color)
print(unique_colors)

unique_colors_1 = {clr for clr in colors}
print(unique_colors_1)


words = ["This", "is", "cool", "mangoes", "oranges", "apple"]
words_count = {len(word) for word in words}
print(words_count)


# Dictionary comprehension

squares = {x: x**2 for x in range(1, 21)}
print(squares)
