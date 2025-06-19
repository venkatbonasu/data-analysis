#Day 5: Given a String below.
#Hello I’m Raj, my mobile number is +91-9876765899 and email id is
#Raj@gmail.com. My Professional Email is rajInd@asp.co.in and phone number is 040- 2254785.
#Extract the phone numbers and email addresses from the string using RegEx and print them.

import re

text = """Hello I’m Raj, my mobile number is +91-9876765899 and email id is
Raj@gmail.com. My Professional Email is rajInd@asp.co.in and phone number is 040- 2254785."""

phone_pattern = r'(\+\d{1,3}-\d{9,10}|\d{3}-\s?\d{7,8})'
email_pattern = r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}'

phones = re.findall(phone_pattern, text)
emails = re.findall(email_pattern, text)

print(phones)
print(emails)
