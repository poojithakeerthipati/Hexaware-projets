# scambled_message = "world the save to time no is there"

# scambled_message_list = scambled_message.split()
# crct_msg = " ".join(scambled_message_list[::-1])
# print(crct_msg)

# N = int(input("Enter the no of stars: "))
# i = 1
# while N >= i:
#     print(i * "✨")
#     i = i + 1

# N = 5
# for i in range(1, N + 1):
#     print(i * "✨")


# for i in range(len(player_stats)):
#     player_stats[i] = 2 * player_stats[i]
# print(player_stats)
#


# for i in player_stats:
#     new_stats.append(2 * i)
# print(player_stats)
# print(new_stats)

avengers = [
    "Hulk",
    "Iron man",
    "Black widow",
    "Captain america",
    "Spider man",
    "Thor",
]

# Task-1
result = []
for super_hero in avengers:
    result.append(len(super_hero))
print(result)


# Task-4.2
result = [len(super_hero) > 10 for super_hero in avengers]
print(result)

letter_count = [4, 8, 11, 15, 10, 4]
large_count = []
for count in letter_count:
    if count > 10:
        large_count.append(count)
print(large_count)

large_count_1 = [count for count in letter_count if count > 10]
print(large_count_1)

# task - 5.1
large_names = []
for super_hero in avengers:
    if len(super_hero) > 10:
        large_names.append(super_hero)
print(large_names)

# Task - 5.2
large_names_1 = [super_hero.upper() for super_hero in avengers if len(super_hero) > 10]
print(large_names_1)
