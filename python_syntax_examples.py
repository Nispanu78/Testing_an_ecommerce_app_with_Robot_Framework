# ----------------------------------------------------------------------------------------------------------------------
# PYTHON FUNDAMENTALS
# ----------------------------------------------------------------------------------------------------------------------



# -----------------------------
# Conditional statements
# -----------------------------



# A. Conditional Logic: if, elif, else Statements
# Conditional statements are fundamental to programming, allowing code execution paths to diverge based on specified conditions.
# Python provides a clear and intuitive syntax for this with if, elif, and else statements.
#
# The basic if statement is the most fundamental control flow mechanism. It executes a block of code only if a specified
# condition evaluates to True. For instance, to check if a number is greater than or equal to two, a simple if statement suffices:

# Python

x = 3
if x >= 2:
    print("x is bigger than or equal to 2")

# This would output: x is bigger than or equal to 2.

# The if-else construct extends this by providing an alternative execution path. If the if condition is True,
# its corresponding block runs; otherwise, the else block executes. This is useful for binary decisions, such as
# determining shipping fees based on an order total:

# Python

order_total = 215.00
if order_total >= 150:
    print("You got free shipping!")
else:
    print("The shipping fee is $5.00")

# This example would print: You got free shipping!
#
# For handling multiple, mutually exclusive conditions, Python employs if-elif-else chains. This structure allows for
# sequential testing of various conditions. The first elif (or initial if) condition that evaluates to True will have
# its corresponding block executed, and all subsequent elif and else blocks will be skipped. The else clause is optional
# and serves as a catch-all, executing its block if none of the preceding if or elif conditions are met. This sequence
# is Python('s idiomatic way to manage multi-way branching, effectively serving as a substitute for switch or case statements '
# 'found in other programming languages, thereby helping to avoid excessive indentation and improving code readability.)

# Consider an example that categorizes an integer input:
#
# Python

x = int(input("Please enter an integer: "))
if x < 0:
    x = 0
    print('Negative changed to zero')
elif x == 0:
    print('Zero')
elif x == 1:
    print('Single')
else:
    print('More')

# If the user enters 42, the output would be More. The syntax rules for this chain are strict: there must always be one
# and only one if statement at the beginning, followed by a logical expression. There can be one or more elif statements,
# each requiring a logical expression. The else statement is optional, must follow all elifs, and cannot contain a logical
# expression itself, as its execution is implicitly dependent on all prior conditions being False.

# Nested conditionals involve placing if statements inside other if or elif blocks. This allows for handling more granular
# or dependent conditions, creating a hierarchical decision structure. For example, checking if a number is within a specific
# range:
#
# Python

number = 7
if number > 0:
    if number < 10:
        print("The number is between 0 and 10!")

# This code would print: The number is between 0 and 10!

# Python also supports a more readable Pythonic chained comparison syntax for checking if a value falls within a range.
# This simplifies the expression and enhances clarity. The previous nested example can be rewritten more concisely:
#
# Python

if 0 < number < 10:
    print("The number is between 0 and 10!")

# This is functionally equivalent to if number > 0 and number < 10, but its conciseness and resemblance to mathematical
# notation improve code comprehension.

# The design choice to offer if-elif-else as an alternative to switch/case and to support chained comparisons underscores
# Python('s emphasis on readability and reduced syntactic verbosity. For a senior automation engineer, these language '
# 'features are not merely stylistic preferences; they directly contribute to more maintainable and less error-prone '
# 'conditional logic within complex automation workflows. This directly impacts debugging efficiency and the overall clarity '
# 'of the code. By simplifying complex decision trees and making the flow of logic immediately apparent, Python's
# approach enables faster comprehension and easier debugging of automation scripts, which is crucial when dealing with
# intricate business rules or system states.


# -----------------------------------------------------------------------------------------------
# Iterating over a sequence with for and while loop
# -----------------------------------------------------------------------------------------------


# B. Iteration with for Loops
# Python's for statement is designed for iterating over items of any sequence or other iterable object in the order they appear, '
# 'a distinct approach from traditional for loops in languages like C or Pascal that often iterate over arithmetic progressions.)

# -------------------------------------
# for loop with simple range() function
# -------------------------------------

# Iterating with range(): Generating Numeric Sequences
# The built-in range() function is highly useful for generating sequences of numbers, which is particularly effective for
# iterating a specific number of times or over indices. It returns an iterable object, which is memory-efficient as it does
# not create the full list of numbers in memory, generating them on demand.
#
# range(stop): Generates numbers starting from 0 up to (but not including) the stop value.
# Python

for i in range(3):
    print(i)
# Output:
# 0
# 1
# 2

# ----------------------------------------------------
# for loop with range() function that starts and stops
# ----------------------------------------------------

# range(start, stop): Generates numbers from start up to (but not including) stop.
# Python

print(list(range(5, 10)))

# -----------------------------------------------------------------------
# for loop with range() function that starts, stops and increment by step
# -----------------------------------------------------------------------

# range(start, stop, step): Generates numbers from start, incrementing (or decrementing) by step, up to (but not including) stop.
# Python

print(list(range(0, 10, 3)))
# Output:
print(list(range(-10, -100, -30)))
# Output: [-10, -40, -70]

# -------------------------------------------------------
# for loop that iterates over a sequence and its indices
# -------------------------------------------------------

# Iterating Over Indices: Combining range() with len() is a common pattern to iterate over the indices of a sequence,
# allowing access to both the index and the element.
# Python

a = ['Mary', 'had', 'a', 'little', 'lamb']
for i in range(len(a)):
    print(i, a[i])

# Output:
# 0 Mary
# 1 had
# 2 a
# 3 little
# 4 lamb

# --------------------------------------------------
# for loop that iterates over sequences and mappings
# --------------------------------------------------

# Python's for statement directly iterates over the items of any iterable, making it highly versatile for different '
# 'data structures.)

# Lists: Iterates through each element in the list.
# Python

words = ['cat', 'window', 'defenestrate']
for w in words:
    print(w, len(w))

# Output:
# cat 3
# window 6
# defenestrate 12

# -----------------------------------
# for loop that iterates over a tuple
# -----------------------------------

# Tuples: Iteration over tuples is very similar to lists, processing each element in sequence. It is also possible to
# unpack elements from a list of tuples directly within the loop.
# Python

x = (10, 20, 30)
for var in x:
    print(var)

# Output:
# 10
# 20
# 30

points = [(1,2), (3,4)]
for a, b in points:
    print(f"{a} plus {b} equals {a+b}")

# Output:
# 1 plus 2 equals 3
# 3 plus 4 equals 7

# ------------------------------------
# for loop that iterates over a string
# ------------------------------------

# Strings: Iterates through each character in the string.
# Python

for char in "Python":
    print(char)

# Output:
# P
# y
# t
# h
# o
# n

# ----------------------------------------
# for loop that iterates over a dictionary
# ----------------------------------------

# Dictionary Keys (Default): When iterating directly over a dictionary, the loop processes its keys by default.
# Python

users = {'Hans': 'active', 'Éléonore': 'inactive'}
for user in users:
    print(user)
# Output:
# Hans
# Éléonore

# Dictionary Values: The .values() method can be used to iterate specifically over the values of a dictionary.
# Python

for status in users.values():
    print(status)

# Output:
# active
# inactive

# Dictionary Items (Key-Value Pairs): The .items() method is used to iterate over both keys and values simultaneously,
# unpacking them into separate loop variables.
# Python

stocks = { 'AAPL': 187.31, 'MSFT': 124.06 }
for key, value in stocks.items():
    print(f"{key} : {value}")

# Output:
# AAPL : 187.31
# MSFT : 124.06


# A critical consideration for senior automation engineers is the important note on modifying collections during iteration.
# Modifying a collection (e.g., adding or deleting items) while iterating over it can lead to subtle bugs or runtime errors,
# such as RuntimeError: dictionary changed size during iteration. This common pitfall can cause unpredictable behavior,
# including skipped elements, which are notoriously difficult to debug in complex automation scripts. When an iterator is
# active and the underlying collection's size or structure changes, the iterator's internal state can become invalid. F
# or automation, where scripts frequently manipulate data structures like lists of tasks, dictionaries of configurations,
# or sets of unique identifiers, such issues can lead to automation failures that are hard to reproduce. It is generally safer
# and more straightforward to iterate over a copy of the collection or to build a new collection to ensure the robustness and
# predictability of automation workflows. A senior engineer demonstrates expertise by proactively avoiding these issues through
# consistent application of defensive programming strategies.

# Python

users = {'Hans': 'active', 'Éléonore': 'inactive', '景太郎': 'active'}

# Strategy: Iterate over a copy to safely delete inactive users
for user, status in users.copy().items():
    if status == 'inactive':
        del users[user]
print(users)

# Output: {'Hans': 'active', '景太郎': 'active'}

# Strategy: Create a new collection for active users
active_users = {}
for user, status in users.items():
    if status == 'active':
        active_users[user] = status
print(active_users)
# Output: {'Hans': 'active', '景太郎': 'active'}

# ----------------------------------------
# for loop with break and continue
# ----------------------------------------

# Controlling for Loop Flow: break and continue
# Loop control statements provide fine-grained management over iteration.
#
# The break statement immediately terminates the innermost enclosing for or while loop. Execution then resumes at the first
# statement after the loop. It is typically used within a conditional statement to exit the loop once a desired condition is
# met, avoiding unnecessary further iterations.
#
# Python

for n in range(2, 10):
    for x in range(2, n):
        if n % x == 0:
            print(f"{n} equals {x} * {n//x}")
            break # Exits the inner loop
# Output:
# 4 equals 2 * 2
# 6 equals 2 * 3
# 8 equals 2 * 4
# 9 equals 3 * 3

# This example finds factors for numbers between 2 and 9. When a factor x is found for n, the factorization is printed,
# and break exits the inner for loop, moving to the next n in the outer loop.
#
# The continue statement skips the rest of the current iteration of the loop and proceeds to the next iteration. Like break,
# it is typically used within a conditional statement.
#
# Python

for num in range(2, 10):
    if num % 2 == 0:
        print(f"Found an even number {num}")
        continue # Skips the rest of this iteration
    print(f"Found an odd number {num}")

# Output:
# Found an even number 2
# Found an odd number 3
# Found an even number 4
# Found an odd number 5
# Found an even number 6
# Found an odd number 7
# Found an even number 8
# Found an odd number 9

# In this example, if num is even, it prints "Found an even number" and continues to the next num without executing the
# subsequent print statement in the same iteration.
#
# The else Clause in for Loops
# Both for and while loops can have an optional else clause. This else block executes only if the loop completes all its
# iterations without encountering a break statement. This is particularly useful for scenarios where one needs to confirm
# if a loop finished its task completely or was interrupted.
#
# Python

for n in range(2, 10):
    for x in range(2, n):
        if n % x == 0:
            print(n, 'equals', x, '*', n//x)
            break
    else: # This else belongs to the inner for loop
        print(n, 'is a prime number')

# Output:
# 2 is a prime number
# 3 is a prime number
# 4 equals 2 * 2
# 5 is a prime number
# 6 equals 2 * 3
# 7 is a prime number
# 8 equals 2 * 4
# 9 equals 3 * 3

# In this example, the inner for loop attempts to find a factor for n. If a factor is found, break is executed, and the
# else clause of the inner for loop is skipped. If no factor is found (meaning the inner loop completes all its iterations),
# the else clause executes, indicating that n is a prime number.
#
# Nested for Loops
# Nested for loops involve placing one or more for loops inside another. This structure is common for processing multi-dimensional
# data structures, such as matrices, or for generating combinations of elements from multiple iterables. The prime number
# example above effectively demonstrates the use of nested for loops.
#
# Must-have Table: for Loop Iteration Examples Across Data Structures
# The following table provides a concise reference for common iteration patterns across fundamental Python data structures,
# which is invaluable for a senior engineer needing to quickly recall or implement specific iteration logic. Mastering these
# idiomatic ways of iterating over various data types is fundamental for writing efficient, readable, and Pythonic code,
# directly impacting the quality and maintainability of automation scripts.

# Usage Type	                        Example Code	                                                                Explanation/Context
# for i in range(stop)	            for i in range(3): print(i)	                                                    Iterates from 0 up to (but not including) stop.
# for i in range(start, stop)	        for i in range(1, 4): print(i)	                                                Iterates from start up to (but not including) stop.
# for i in range(start, stop, step)	for i in range(0, 10, 2): print(i)	                                            Iterates from start, incrementing by step, up to stop.
# for item in my_list	                my_list = ; for item in my_list: print(item)	                                Iterates directly over each element in a list.
# for item in my_tuple	            my_tuple = (10, 20); for item in my_tuple: print(item)	                        Iterates directly over each element in a tuple.
# for char in my_string	            my_string = "abc"; for char in my_string: print(char)	                        Iterates directly over each character in a string.
# for key in my_dict	                my_dict = {'a':1, 'b':2}; for key in my_dict: print(key)	                    Iterates over the keys of a dictionary (default behavior).
# for value in my_dict.values()	    my_dict = {'a':1, 'b':2}; for value in my_dict.values(): print(value)	        Iterates specifically over the values of a dictionary.
# for key, value in my_dict.items()	my_dict = {'a':1, 'b':2}; for k, v in my_dict.items(): print(f"{k}:{v}")	    Iterates over key-value pairs of a dictionary.
# for item in my_set	                my_set = {1, 2, 3}; for item in my_set: print(item)	                            Iterates over unique elements in a set (order not guaranteed).
# for line in file_object	            with open('file.txt') as f: for line in f: print(line.strip())	                Iterates line by line over the contents of a file.
# for x, y in list_of_tuples	        points = [(1,2), (3,4)]; for x, y in points: print(x+y)	                        Unpacks elements from inner iterables (e.g., tuples in a list).

# -------------------------------------
# while loop
# -------------------------------------

# C. Conditional Repetition: while Loops
# The while loop is a control flow statement that repeatedly executes a block of code as long as a given condition remains True.
# The condition is evaluated at the beginning of each iteration.
#
# A basic while loop structure is straightforward:
#
# Python

count = 0
while count < 5:
    print(count)
    count += 1

# Output:
# 0
# 1
# 2
# 3
# 4

# This loop continues as long as count is less than 5. In each iteration, count is printed and then incremented.
#
# Controlling while Loop Flow: break and continue
# Similar to for loops, while loops also support break and continue statements for flow control.
#
# The break statement functions identically to its use in for loops, immediately terminating the while loop. Execution
# then resumes at the first statement after the loop.
#
# Python

num = 1
while num <= 10:
    if num == 6:
        break # Loop terminates when num is 6
    print(num)
    num += 1
# Output:
# 1
# 2
# 3
# 4
# 5

# In this case, the loop prints numbers from 1 to 5, and when num becomes 6, the break statement is executed, causing the
# loop to exit prematurely.
#
# The continue statement also functions identically to its use in for loops, skipping the remainder of the current iteration
# and moving directly to the next one.
#
# Python

num = 1
while num <= 5:
    if num == 3:
        num += 1 # Important to increment before continue to avoid infinite loop
        continue # Skips print(3)
    print(num)
    num += 1

# Output:
# 1
# 2
# 4
# 5

# Here, when num is 3, the continue statement is triggered, skipping the print(num) statement for that iteration. It is
# crucial to ensure that the loop variable (num in this case) is incremented before continue is called to prevent an
# unintentional infinite loop.
#
# The pass Statement as a Placeholder
# The pass statement in Python does nothing. It serves as a null operation, used when a statement is syntactically required
# but no action is desired within the code block.
#
# Common usages include:
#
# Busy-wait loop: To create an infinite loop that simply idles until an external interruption (e.g., Ctrl+C).
# Python

while True:
    pass  # Busy-wait for keyboard interrupt (Ctrl+C)

# Minimal classes: To define an empty class that can be extended later.
# Python

class MyEmptyClass:
    pass


# Placeholder for unimplemented code: During development, pass can be used as a temporary placeholder in functions or
# conditional bodies, ensuring the code remains syntactically correct while the logic is still being designed.
# Python

def initlog(*args):
    pass   # Remember to implement this!

# The else Clause in while Loops
# Similar to for loops, a while loop can also have an else block associated with it. This else block executes if the loop
# completes naturally (i.e., its condition becomes False) without being terminated by a break statement.  
#
# Python

num = 1
while num <= 5:
    print(num)
    num += 1
else:
    print("Loop completed normally.")

# Output:
# 1
# 2
# 3
# 4
# 5
# Loop completed normally.

# In this example, since the loop condition num <= 5 eventually becomes False and no break statement is encountered, the
# else block executes.
#
# Intentional and Unintentional Infinite Loops
# The distinction between intentional and unintentional infinite loops is of paramount importance for senior automation engineers.
#
# Intentional infinite loops: A while True: construct is used for scenarios where a loop is expected to run indefinitely
# until an external condition is met or an explicit break is triggered. This is a common design pattern in automation for
# long-running processes such as event loops (e.g., in graphical user interfaces or game development), server processes, or
# continuous polling for external states (e.g., checking a file's existence or a server's availability).

# Python

import time, random
MAX_RETRIES = 5
attempts = 0
while attempts < MAX_RETRIES:
    attempts += 1
    print(f"Attempt {attempts}: Connecting to the server...")
    time.sleep(0.3)
    if random.random() > 0.7: # Simulate success
        print("Connection successful!")
        break
else:
    print("Failed to connect after multiple attempts.")

# This example demonstrates polling a server status with a retry mechanism, using break to exit upon success.
#
# Unintentional infinite loops: These occur when the loop condition never becomes False due to a logical error in the code,
# leading to the program hanging indefinitely or consuming excessive system resources.
#
# Python

# Example of unintentional infinite loop
# number = 5
# while number!= 0:
#     print(number)
#     number -= 2 # This will loop indefinitely as number will be 5, 3, 1, -1, -3... never 0

# In this erroneous example, number will never reach 0 by decrementing by 2, causing the loop to run forever.
#
# For a senior automation engineer, the reliability and stability of automated systems are paramount. Automation frequently
# involves long-running tasks like continuous monitoring, API polling, or maintaining persistent connections.
# These scenarios naturally lead to the use of while True for intentional infinite loops. However, without proper
# termination conditions, these can easily become resource-draining, unintended infinite loops—a severe class of bug.
# Understanding the control flow mechanisms (break, continue, and the else clause) is key to designing and managing these
# loops effectively, ensuring the resilience and reliability of automation systems. This reflects a mature approach to
# system design and fault tolerance.
#
# Nested while Loops
# Similar to for loops, while loops can be nested within each other to handle repetitive tasks that themselves contain
# repetitive sub-tasks. This is useful for scenarios requiring multiple levels of iteration based on dynamic conditions.
#
# Python

outer_num = 1
while outer_num <= 3:
    inner_num = 1
    while inner_num <= 3:
        print(outer_num, inner_num)
        inner_num += 1
    outer_num += 1

# Output:
# 1 1
# 1 2
# 1 3
# 2 1
# 2 2
# 2 3
# 3 1
# 3 2
# 3 3

# In this example, the outer while loop runs three times. For each iteration of the outer loop, the inner while loop also
# runs three times, demonstrating a typical pattern for processing two-dimensional conceptual data or states.
#
# Common Use Cases
# while loops are commonly employed in automation and general programming for various scenarios:
#
# Iterating until a specific condition is met: Such as finding the first power of 2 greater than 1000.
# Validating user input: Repeatedly prompting for input until it meets certain criteria.
# Implementing game loops or event loops: Where the program continuously processes events or updates states.
# Polling external systems: Regularly checking the status of a server, a file, or a database until a desired state is achieved.
# Managing asynchronous operations: In frameworks that rely on event-driven programming.



# -----------------------------
# FUNCTIONS
# -----------------------------



# How to define a function with positional parameters and positional parameters with default values

def parrot(voltage, flying, state='a stiff', action='voom', type='Norwegian Blue'):
    print("-- if you put", voltage, "volts through it.")
    print("-- It's", state, "!")
    print("-- This parrot wouldn't", action)
    print("-- Lovely plumage, the" + type +' it is flying ' + flying)

# The function is called wit the two mandatory positional arguments only. The other parameters are called automatically with their default values
parrot(1000, 'high')

# How to define a function with arbitrary positional adn keyword parameters
def my_function(*args, **kwargs):
    print(*args)
    for key, value in kwargs.items():
        print(f"{key}: {value}")

# The function is called with an arbitrary number of positional and keyword arguments
my_function(2, 3, 5, 'bomba', 1, 6, 7, 'la vida loca', True, name='John', surname='Smith')
# Here only the arbitrary positional arguments are used, while no keyword argument is used, which is OK since the function
# has been defined with arbitrary keyword parameters, which means there can be either 1000 and more or 0
my_function(2, 3, 5, 'bomba', 1, 6, 7, 'la vida loca', True)

# parrot('a million')

# Another example with string concatenation
def greetings(name, greeting='Hello', question='How are you? '):
    print(greeting + ' ' + name + ': ' + question)

greetings('Alice', 'Buongiorno', 'Sei una gran fica, non e\' vero?')


# How to define a function with positional only and keyword only parameters
def combined_example(pos_only, /, standard, *, kwd_only):
    print(pos_only, standard, kwd_only)


combined_example('Bomba, ', 'Hello', kwd_only='Bomba, the great!')

# Lamdba function
# The magic here is that the lambda function "remembers" the value of n from when it was created,
# even after make_incrementor has finished running. This is called a closure -
# the inner function captures and retains access to variables from its surrounding scope.

def make_incrementor(n):
    return lambda x: x + n

f = make_incrementor(5)
print(f(6))



# -----------------------------
# Data Types
# -----------------------------



# A list comprehension consists of brackets containing an expression followed by a for clause, then zero or more for
# or if clauses.

squares = [x**2 for x in range(10)]

# Another example:

vec = [-4, -2, 0, 2, 4]
# create a new list with the values doubled
list_comprehension = [x*2 for x in vec]
print(list_comprehension)
# [-8, -4, 0, 4, 8]

# flatten a list using a listcomp with two 'for'
vec = [[1,2,3], [4,5,6], [7,8,9]]
flattened_list = [num for elem in vec for num in elem]
print(flattened_list)

# Tuple packing

t = 12345, 54321, 'hello!'

# Tuple unpacking

x, y, z = t

print(x, y, z)

# Sets
basket = {'apple', 'orange', 'apple', 'pear', 'orange', 'banana'}
print(basket) # show that duplicates have been removed
# {'orange', 'banana', 'pear', 'apple'}
membership_testing = 'orange' in basket # fast membership testing
print(membership_testing)
membership_testing2 = 'crabgrass' in basket
print(membership_testing2)

# Set comprehension
# Similarly to list comprehensions, set comprehensions are also supported:
a = {x for x in 'abracadabra' if x not in 'abc'}
print(a)

# Dictionaries
tel = {'jack': 4098, 'sape': 4139}
# Here we add another key-value pair to the dictionary 'tel'
tel['guido'] = 4127
print(tel)
# Result
# {'jack': 4098, 'sape': 4139, 'guido': 4127}
# How to delete a key and insert a a new one
del tel['sape']
tel['irv'] = 4127
print(tel)
# Result
# {'jack': 4098, 'guido': 4127, 'irv': 4127}
# Print the list of keys
print(list(tel.keys()))
# Other operations
print(sorted(tel))
# Result
# ['guido', 'irv', 'jack']
print('guido' in tel)
print('jack' not in tel)

# Dictionary comprehension
print({x: x**2 for x in (2, 4, 6)})

# Use of dict() method to creat dictionaries

# When the keys are simple strings, it is sometimes easier to specify pairs using keyword arguments:
print(dict(sape=4139, guido=4127, jack=4098))
# Result
# {'sape': 4139, 'guido': 4127, 'jack': 4098}

# Looping through a dictionary

knights = {'Gallahad': 'the pure', 'Robin': 'the brave'}
for k, v in knights.items():
    print(k, v)

# Result
# Gallahad the pure
# robin the brave



# -----------------------------
# Looping
# -----------------------------



# Looping techniques

# When looping through a sequence, the position index and corresponding value can be retrieved at the same time using
# the enumerate() function.

for i, v in enumerate(['tic', 'tac', 'toe']):
    print(i, v)

# Results
# 0 tic
# 1 tac
# 2 toe

# To loop over two lists with zip() method

questions = ['name', 'quest', 'favorite color']
answers = ['lancelot', 'the holy grail', 'blue']

for q, a in zip(questions, answers):
    print('What is your {0}? It is {1}.'.format(q, a))

# What is your name? It is lancelot.
# What is your quest? It is the holy grail.
# What is your favorite color? It is blue.

# To loop over a sequence in reverse, first specify the sequence in a forward direction and then call the reversed()
# function

for i in reversed(range(1, 10, 2)):
    print(i)

# To loop over a sequence in sorted order, use the sorted() function which returns a new sorted list while leaving
# the source unaltered

basket = ['apple', 'orange', 'apple', 'pear', 'orange', 'banana']

for i in sorted(basket):
    print(i)

# To loop over a sequence in sorted order and by removing duplicates use sorted() in combination with set() methods

basket = ['apple', 'orange', 'apple', 'pear', 'orange', 'banana']

for f in sorted(set(basket)):
    print(f)

# To change a list while you are looping over it

import math
raw_data = [56.2, float('NaN'), 51.7, 55.3, 52.5, float('NaN'), 47.8]
filtered_data = []
for value in raw_data:
    if not math.isnan(value):
        filtered_data.append(value)

print(filtered_data)

# Example of the walrus operator in a Python expression
# The walrus operator := assigns a value to a variable as part of an expression.
# The key benefit is that it makes code more concise and efficient by combining assignment with the expression where the value is used.
# Instead of writing this:
data = input("Enter something (or 'quit' to exit): ")
while data != 'quit':
    print(f"You entered: {data}")
    data = input("Enter something (or 'quit' to exit): ")

print("---")

# You can write this with the walrus operator:

while (data := input("Enter something (or 'quit' to exit): ")) != 'quit':
    print(f"You entered: {data}")

# Example 2: Using walrus operator in list comprehension
# Get squares of numbers, but only if the square is greater than 10
numbers = [1, 2, 3, 4, 5, 6, 7, 8]

# Without walrus operator (inefficient - calculates square twice):
squares = [x**2 for x in numbers if x**2 > 10]

# With walrus operator (efficient - calculates square once):
squares_walrus = [square for x in numbers if (square := x**2) > 10]

print("Numbers:", numbers)
print("Squares > 10 (without walrus):", squares)
print("Squares > 10 (with walrus):", squares_walrus)



# -----------------------------
# MODULES
# -----------------------------



# Explanation of
# if __name__ == "___main__"
#     main()

# The if __name__ == "__main__": construct in Python is a common idiom that allows you to control when certain code runs. Here's how it works:
# What it does
# When Python runs a file, it automatically sets a special variable called __name__. The value depends on how the file is being executed:
#
# If you run the file directly (like python myfile.py), Python sets __name__ to "__main__"
# If you import the file as a module in another script, __name__ gets set to the actual filename (without .py)
#
# Why it's useful
# This allows you to write code that only runs when the script is executed directly, not when it's imported.

# __name__ is a single variable that gets set to different string values depending on how the file is run:
# When run directly:
# bashpython myfile.py
#
# __name__ gets set to the string "__main__" (literally the word "main")
# __name__ does NOT contain "myfile.py"
#
# When imported:
# pythonimport myfile
#
# __name__ gets set to "myfile" (the module name, without .py)
#
# The key point:
#
# "__main__" is just a special string literal that Python uses to indicate "this file is being run directly"
# It's not a reference to the filename
# The comparison if __name__ == "__main__": is checking if the string stored in __name__ equals the string "__main__"
#
# You can see this in action:

# myfile.py
print(f"The value of __name__ is: {__name__}")

if __name__ == "__main__":
    print("This file was run directly")
else:
    print("This file was imported")

# __name__ is a built-in global variable in Python

# There is a variant of the import statement that imports names from a module directly into the importing module’s
# namespace. For example:

# from fibo import fib, fib2
# fib(500)

# 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377

# If the module name is followed by as, then the name following as is bound directly to the imported module.

# import fibo as fib


