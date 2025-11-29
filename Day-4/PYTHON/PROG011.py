'''
Remove Consecutive Duplicates

Question
Given a list of integers, create a new list that keeps only one value from each consecutive block of duplicates.

Sample Input
nums = [2, 2, 2, 5, 5, 3, 3, 3, 7, 2, 2]

Expected Output
[2, 5, 3, 7, 2]
'''

# Approach 1 : Simple Loop + Previous Check
nums = [2, 2, 2, 5, 5, 3, 3, 3, 7, 2, 2]
result = []
for i in range(len(nums)):
    if i == 0 or nums[i] != nums[i - 1]:
        result.append(nums[i])
print(result)

# Approach 2
nums = [2, 2, 2, 5, 5, 3, 3, 3, 7, 2, 2]

result = [nums[0]]
for n in nums[1:]:
    if n != result[-1]:
        result.append(n)

print(result)
