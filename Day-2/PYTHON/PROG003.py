'''
Sum of even numbers in a list

Question:
Given a list of integers, find the sum of all even numbers.

Sample Input:
my_list = [10, 15, 22, 33, 40, 7]

Expected Output:
72       # 10 + 22 + 40
'''

# Approach 1 : For Loop
my_list = [10, 15, 22, 33, 40, 7]

sum_even = 0
for num in my_list:
    if num % 2 == 0:
        sum_even = sum_even + num

print(sum_even)

# Approach 2 : sum + comprehension
my_list = [10, 15, 22, 33, 40, 7]
sum_even = sum(num for num in my_list if num % 2 == 0)
print(sum_even)


