'''
Find the highest frequency of any number in a list

Question:
Given a list of integers, find the maximum number of times any value appears (i.e., the highest frequency).

Sample Input:
my_list = [2, 5, 2, 7, 5, 2, 9]

Expected Output:
3
'''

# Approach 1 : dictionary for frequency
my_list = [2, 5, 2, 7, 5, 2, 9]
freq = {}
for num in my_list:
    if num in freq:
        freq[num] += 1
    else:
        freq[num] = 1

max_freq = max(freq.values())
print(max_freq)

# Approach 2 
my_list = [2, 5, 2, 7, 5, 2, 9]
seen = []
counts = []
for num in my_list:
    if num in seen:
        continue
    seen.append(num)

    count = 0
    for n in my_list:
        if n == num:
            count += 1
    counts.append(count)
print(max(counts))
