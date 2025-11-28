'''
Remove duplicates from a list (keep order)

Question:
Given a list of integers, remove duplicates while keeping the original order of first appearance.

Sample Input:
my_list = [2, 5, 2, 7, 5, 9, 2]

Expected Output:
[2, 5, 7, 9]
'''

# Approach 1
my_list = [2, 5, 2, 7, 5, 9, 2]
new_list = []

for num in my_list:
    if num in new_list:
        continue
    new_list.append(num)

print(new_list)

# Approach 2 : using set to track seen elements
my_list = [2, 5, 2, 7, 5, 9, 2]
seen = set()
new_list = []
for num in my_list:
    if num not in seen:
        seen.add(num)
        new_list.append(num)
print(new_list)
