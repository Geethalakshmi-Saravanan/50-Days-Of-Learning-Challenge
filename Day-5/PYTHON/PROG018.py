'''
First negative number index

Input
nums = [4, 7, 0, -3, 5, -2]

Expected Output
3
'''

nums = [4, 7, 0, -3, 5, -2]

for n in nums:
    if n < 0:
        print(nums.index(n))
        break
