'''
Find maximum element in a list

Question:
Given a list of integers, find the maximum value.

Sample Input:
my_list = [12, 99, 4, 23, 45, 100, 7]

Expected Output:
100
'''

# Approach 1 : built-in max()
my_list = [12, 99, 4, 23, 45, 100, 7]
answer = max(my_list)
print(answer)

# Approach 2 : manual loop
my_list = [12, 99, 4, 23, 45, 100, 7]
max_val = my_list[0]
for num in my_list[1:]:
    if num > max_val:
        max_val = num
print(max_val)
