'''
Longest increasing streak

Input
nums = [3, 4, 2, 5, 6, 1, 2, 3, 4]

Expected Output
3
'''

nums = [3, 4, 2, 5, 6, 1, 2, 3, 4]

current_streak = 0
max_streak = 0

for i in range(len(nums) - 1):
    if nums[i] < nums[i+1]:
        current_streak += 1
        max_streak = max(max_streak, current_streak)
    else:
        current_streak = 0

print(max_streak)
