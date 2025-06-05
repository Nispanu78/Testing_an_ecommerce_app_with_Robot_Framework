# import python_syntax_examples

# --------------------------------------------------------
# CLASS EXAMPLE
# --------------------------------------------------------

print("=== Class examples ===")
print("\n")

class Car:
    def __init__(self, color, fuel_level=100):
        # Data attributes - variables that belong to this car instance
        self.color = color
        self.fuel_level = fuel_level
        self.is_running = False

    # Methods - functions that belong to this car class/instance
    def start_engine(self):
        """Method to start the car"""
        if self.fuel_level > 0:
            self.is_running = True
            print(f"The {self.color} car is now running!")
        else:
            print("Cannot start - no fuel!")

    def drive(self, distance):
        """Method to drive the car a certain distance"""
        if not self.is_running:
            print("Start the engine first!")
            return

        fuel_needed = distance * 1  # 0.1 fuel per unit distance
        if self.fuel_level >= fuel_needed:
            self.fuel_level -= fuel_needed
            print(f"Drove {distance} units. Fuel remaining: {self.fuel_level}")
        else:
            print("Not enough fuel for this trip!")

    def get_status(self):
        """Method to report the car's current status"""
        status = "running" if self.is_running else "stopped"
        return f"{self.color} car is {status} with {self.fuel_level} fuel"


# Create instances - each has its own data attributes
car1 = Car("red")
car2 = Car("blue", fuel_level=50)

# Each instance can use the same methods, but they operate on that instance's data that is different between instances
car1.start_engine()  # Method belongs to car1, uses car1's attributes

car1.drive(20)  # Method modifies car1's fuel_level
print(car1.get_status())

print(car2.color)
car2.start_engine()  # Same method, but uses car2's attributes
car2.drive(100)  # Same method, but affects car2's fuel_level
print(car2.get_status())
print("\n" + "=" * 40)

# --------------------------------------------------------
# INHERITANCE AND MULTIPLE INHERITANCE EXAMPLE
# --------------------------------------------------------

# Basic inheritance with super()
print("=== Inheritance and multi inheritance examples ===")
print("\n")
class Animal:
    def __init__(self, name, species):
        self.name = name
        self.species = species
        print(f"Animal created: {name}")

    def make_sound(self):
        print(f"{self.name} makes a sound")

    def info(self):
        print(f"Name: {self.name}, Species: {self.species}")


class Dog(Animal):
    def __init__(self, name, breed): #"breed" is an instance attribute specific to the Dog class
        # Call parent constructor using super()
        super().__init__(name, "Canine")
        self.breed = breed
        print(f"Dog created: {name} ({breed})")

    def make_sound(self):
        # Call parent method first, then extend it
        super().make_sound()
        print(f"{self.name} barks: Woof!")

    def info(self):
        # Extend parent info method
        super().info()
        print(f"Breed: {self.breed}")


# Usage example
print("=== Creating a Dog")
my_dog = Dog("Buddy", "Golden Retriever")

print("\n=== Calling methods ===")
my_dog.make_sound()
print()
my_dog.info()
print("\n" + "=" * 40)

# --------------------------------------------------------
# DECORATOR EXAMPLE
# --------------------------------------------------------

print("=== Decorators examples ===")
print("\n")
def my_decorator(func):
    def wrapper():
        print("Something before the function")
        func()
        print("Something after the function")
    return wrapper

@my_decorator
def say_hello():
    print("Hello!")

say_hello()  # Same output as above
print("\n" + "=" * 40)

# --------------------------------------------------------
# ITERATOR EXAMPLE
# --------------------------------------------------------

print("=== Iterators examples ===")
class CountDown:
    def __init__(self, start):
        self.start = start

    def __iter__(self):
        return self

    def __next__(self):
        if self.start <= 0:
            raise StopIteration
        self.start -= 1
        return self.start + 1

print("\n")


# Usage
countdown = CountDown(3)
for num in countdown:
    print(num)  # Output: 3, 2, 1

# This piece of code prints "=" 40 times
print("\n" + "=" * 40)

# --------------------------------------------------------
# GENERATOR EXAMPLE
# --------------------------------------------------------

print("=== Generators examples ===")
print("\n")
class GeneratorCounter:
    """Class with a generator method"""

    def count_up_to(self, n):
        """Generator that yields numbers from 1 to n"""
        i = 1
        while i <= n:
            yield i
            i += 1


# Using the generator inside a class
counter_obj = GeneratorCounter()
generator = counter_obj.count_up_to(3)

print("Numbers from generator:")
for num in generator:
    print(num)

# This piece of code prints "=" 40 times
print("\n" + "=" * 40)

# --------------------------------------------------------
# STRING PATTERN MATCHING EXAMPLE
# --------------------------------------------------------

print("=== An example of 're' one of the libraries of the standard library ===")
print("\n")
import re
print(re.findall(r'\bf[a-z]*', 'which foot or hand fell fastest'))
print("\n" + "=" * 40)

# --------------------------------------------------------
# MATHEMATICS EXAMPLE
# --------------------------------------------------------
print("=== An example of some modules from the standard library to perform mathematical operations ===")
print("=== Math module ===")
import math
print(math.cos(math.pi / 4))
print("\n")
print(math.log(1024, 2))
print("\n")

# The random module provides tools for making random selections:
print("=== Random module ===")
import random
print(random.choice(['apple', 'pear', 'banana']))
print("\n")
print(random.sample(range(100), 10)) # sampling without replacement
print("\n")

print(random.random()) # random float from the interval [0.0, 1.0)
print("\n")
print(random.randrange(6)) # random integer chosen from range(6)
print("\n")

# The statistics module calculates basic statistical properties (the mean, median, variance, etc.) of numeric data:
print("=== Statistics module ===")
import statistics
data = [2.75, 1.75, 1.25, 0.25, 0.5, 1.25, 3.5]
print(statistics.mean(data))
print("\n")

print(statistics.median(data))
print("\n")
print(statistics.variance(data))
print("\n" + "=" * 40)

# --------------------------------------------------------
# INTERNET ACCESS EXAMPLES
# --------------------------------------------------------

# There are a number of modules for accessing the internet and processing internet protocols. Two of the simplest are
# urllib.request for retrieving data from URLs and smtplib for sending mail:
print("=== An example to work with the internet ===")
from urllib.request import urlopen
from urllib.error import HTTPError, URLError
import time

def get_time_with_retry(max_retries=3, timeout=10):
    for attempt in range(max_retries):
        try:
            with urlopen('http://worldtimeapi.org/api/timezone/etc/UTC.txt', timeout=timeout) as response:
                for line in response:
                    line = line.decode()
                    if line.startswith('datetime'):
                        print(line.rstrip())
                        return
        except (HTTPError, URLError) as e:
            print(f"Attempt {attempt + 1} failed: {e}")
            if attempt < max_retries - 1:
                time.sleep(2)  # Wait before retrying
            else:
                print("All attempts failed")

get_time_with_retry()

#      In order to work this example requires a mailserver running on localhost

# import smtplib
# server = smtplib.SMTP('localhost')
# server.sendmail('soothsayer@example.org', 'jcaesar@example.org',
#                 """To: jcaesar@example.org
#                 From: soothsayer@example.org
#                 Beware the Ides of March.""")
# server.quit()
print("\n" + "=" * 40)

# --------------------------------------------------------
# DATE AND TIME
# --------------------------------------------------------

print("=== Examples on how to work with date and time ===")
from datetime import date
now = date.today()
print(now)

print(now.strftime("%m-%d-%y. %d %b %Y is a %A on the %d day of %B."))

# dates support calendar arithmetic
birthday = date(1978, 12, 24)
age = now - birthday
print(age.days)
print("\n" + "=" * 40)

# --------------------------------------------------------
# DATA COMPRESSION
# --------------------------------------------------------

print("=== Examples on data compression and decompression ===")
import zlib
s = b'witch which has which witches wrist watch'
print(len(s))

t = zlib.compress(s)
print(len(t))

zlib.decompress(t)
print(t)

zlib.crc32(s)

print(s)
print("\n" + "=" * 40)

# --------------------------------------------------------
# QUALITY CONTROL
# --------------------------------------------------------

import unittest


def average(numbers):
    """
    Calculate the arithmetic mean of a list of numbers.

    Args:
        numbers (list): A list of numeric values

    Returns:
        float: The arithmetic mean of the input numbers

    Raises:
        ZeroDivisionError: If the input list is empty
        TypeError: If input is not a list or contains non-numeric values
    """
    if not isinstance(numbers, list):
        raise TypeError("Input must be a list of numbers")

    if len(numbers) == 0:
        raise ZeroDivisionError("Cannot calculate average of empty list")

    try:
        return sum(numbers) / len(numbers)
    except TypeError:
        raise TypeError("All elements must be numeric")


class TestAverageFunction(unittest.TestCase):
    """Test suite for the average function."""

    def test_average_with_integers(self):
        """Test average calculation with integer values."""
        result = average([20, 30, 70])
        self.assertEqual(result, 40.0)

    def test_average_with_decimal_result(self):
        """Test average calculation that results in decimal values."""
        result = average([1, 5, 7])
        self.assertAlmostEqual(result, 4.333333333333333)
        # Test rounded result as in original
        self.assertEqual(round(result, 1), 4.3)

    def test_average_with_mixed_numbers(self):
        """Test average with both integers and floats."""
        result = average([1, 2.5, 3])
        self.assertEqual(result, 2.1666666666666665)

    def test_average_with_single_number(self):
        """Test average with a single number."""
        result = average([42])
        self.assertEqual(result, 42.0)

    def test_empty_list_raises_zero_division_error(self):
        """Test that empty list raises ZeroDivisionError."""
        with self.assertRaises(ZeroDivisionError):
            average([])

    def test_non_list_input_raises_type_error(self):
        """Test that non-list input raises TypeError."""
        with self.assertRaises(TypeError):
            average(20, 30, 70)  # This will fail - not a list

        with self.assertRaises(TypeError):
            average("not a list")

    def test_non_numeric_elements_raise_type_error(self):
        """Test that non-numeric list elements raise TypeError."""
        with self.assertRaises(TypeError):
            average([1, 2, "three"])

        with self.assertRaises(TypeError):
            average([1, None, 3])


if __name__ == '__main__':
    # Run the tests
    unittest.main()