'''
Square Only Positive Numbers

Question
Given a list of integers (positive, negative, zero), create a new list containing the square of only the positive numbers, in the same order.

Sample Input
nums = [3, -1, 0, 5, -4, 2]

Expected Output
[9, 25, 4]
'''

# Approach 1 
nums = [3, -1, 0, 5, -4, 2]
result = []

for n in nums:
    if n > 0:
        result.append(n * n)

print(result)

# Approach 2 : List comprehension
result = [n*n for n in nums if n > 0]
print(result)
