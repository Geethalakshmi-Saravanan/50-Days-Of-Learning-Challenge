'''
Count even numbers

Input
nums = [3, 6, 10, 7, 2]

Expected Output
3
'''

nums = [3, 6, 10, 7, 2]
count = 0
for i in nums:
    if i % 2 == 0:
        count += 1
print(count)
