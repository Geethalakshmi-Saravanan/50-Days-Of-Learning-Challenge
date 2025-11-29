'''
Cumulative Sum List
Question

Given a list of integers, create a new list where each element at index i is the sum of all elements from index 0 to i.

Sample Input
nums = [3, 1, 4, 2]

Expected Output
[3, 4, 8, 10]
'''

# Approach 1  
nums = [3, 1, 4, 2]
result = []
n = nums[0]
for i in range(len(nums)):
    result.append(n)
    if i < len(nums) - 1:
        n = result[i] + nums[i + 1]
print(result)

# Approach 2 
nums = [3, 1, 4, 2]
result = []
running = 0
for n in nums:
    running += n
    result.append(running)
print(result)

# Approach 3 : Pythonic List Comprehension
nums = [3, 1, 4, 2]
result = []
running = 0
for n in nums:
    running += n
    result.append(running)
print(result)

