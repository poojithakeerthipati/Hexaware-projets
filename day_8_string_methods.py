# msg = "Hi, all"

# # Case methods
# print(msg.upper())
# print(msg.lower())
# print(msg.title())
# print(msg.capitalize())


# quote = "Dream"
# print(quote[::-1])

# print(quote)
# print(quote.strip())


# quote1 = "----Dream is not something-that you see in sleep, Dream is something that does not let you sleep----"
# print(quote1.strip("-"))
# print(quote1.lstrip("-"))
# print(quote.replace("something","pooji"))
# print(quote)

# After the 🔑
message = "    🚨🔍📱🔑secret_code✌️"
# code = "SECRET_CODE✌️"

# output = message[8:].upper()

# if output == code:
#     print("You are an hacker 🎊")
# else:
#     print("Try again")


# Output
# "You are an hacker"

# "Try again"


# Task-2

message = "    🚨🔍📱🔑****secret_code✌️((("
key = message.find("🔑")
message = message[key + 1 :]
message = message.strip("*(")
print(message, len(message))
# message = message.strip()
# message = message.strip("*")
# print(message)
