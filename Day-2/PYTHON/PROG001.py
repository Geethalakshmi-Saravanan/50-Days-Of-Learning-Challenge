'''
Filter even numbers from a list

Question:
Given a list of integers, return a new list containing only the even numbers.
Sample Input:
my_list = [12, 5, 8, 21, 44, 3, 10]
Expected Result:
[12, 8, 44, 10]
'''

# Approach 1 : loop
my_list = [12, 5, 8, 21, 44, 3, 10]
even_numbers = []

for num in my_list:
    if num % 2 == 0:
        even_numbers.append(num)

print(even_numbers)

# Approach 2 : List comprehension
my_list = [12, 5, 8, 21, 44, 3, 10]
even_numbers = [num for num in my_list if num % 2 == 0]
print(even_numbers)
