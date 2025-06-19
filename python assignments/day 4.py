#Day 4:
#1. Create a function to find whether given string is Palindrome or not.

"""def palindrome(word):
    word == word[::-1]
    return word == word.lower()

print (palindrome ("level"))"""


#2. Create a calculator application using functions, provide an option to user to
#choose which operation to perform. Use Exception handling.
#Expected output:
#Click 1 for Add
#Click 2 for Sub
#Click 3 for Mul
#Click 4 for Div
#(After user selecting the operation. Take two inputs from the user and print the answer.)

def add(a,b):
    return a+b
def sub(a,b):
    return a-b
def mul(a,b):
    return a*b
def div(a,b):
    return a/b

    print("Click 1 for Add",
           "Click 2 for Sub",
           "Click 3 for Mul",
           "Click 4 for Div")
try:
    choice = int(input("Enter your choice (1/2/3/4):"))

    if choice in [1,2,3,4,5]:
      num1 = int(input("Enter first number: "))
      num2 = int(input("Enter second number: "))
      if choice == 1:
          print(add(num1,num2))
      elif choice == 2:
          print(sub(num1,num2))
      elif choice == 3:
          print(mul(num1,num2))
      elif choice == 4:
          print(div(num1,num2))
    else:
          print("invalid choice")
except ValueError:
   print("enter correct value")
except ZeroDivisionError:
   print("hey you divided a num with zero")