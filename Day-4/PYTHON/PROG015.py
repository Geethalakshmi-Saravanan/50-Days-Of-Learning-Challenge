'''
Longest Consecutive Streak Above Threshold

Question
You are given a list of daily step counts.
Find the length of the longest consecutive streak where the number of steps is greater than or equal to 8000.
A streak resets whenever a number falls below 8000.

Sample Input
steps = [5000, 8200, 9000, 4000, 10000, 11000, 12000, 3000]

Expected Output
3
'''

# Approach 1
steps = [5000, 8200, 9000, 4000, 10000, 11000, 12000, 3000]
current = 0
max_streak = 0
for s in steps:
    if s >= 8000:
        current += 1
        if current > max_streak:
            max_streak = current
    else:
        current = 0
print(max_streak)

# Approach 2
steps = [5000, 8200, 9000, 4000, 10000, 11000, 12000, 3000]
current = 0
max_streak = 0
for s in steps:
    current = current + 1 if s >= 8000 else 0
    max_streak = max(max_streak, current)
print(max_streak)
