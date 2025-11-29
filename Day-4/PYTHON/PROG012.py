'''
First Day Running Total Reaches Target
Question

Given a list of daily savings, find the first day on which the running total becomes greater than or equal to a target amount.
Return the day index (1-based) and the total.

Sample Input
savings = [200, 150, 350, 100, 300]
target = 700

Expected Output
Day: 3, Total: 700
'''

# Approach 1
savings = [200, 150, 350, 100, 300]
target = 700

running_total = savings[0]

for i in range(len(savings) - 1):
    if running_total >= target:
        print("Day : %d, Total : %d" % (i+1, running_total))
        break
    else:
        running_total += savings[i+1]

# Approach 2
savings = [200, 150, 350, 100, 300]
target = 700

total = 0
for day in range(len(savings)):
    total += savings[day]
    if total >= target:
        print(f"Day: {day + 1}, Total: {total}")
        break
else:
    print("Target not reached")
