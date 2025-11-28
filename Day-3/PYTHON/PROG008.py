'''
Extract all numbers from a string

Question:
Given a string that contains letters and digits, extract all the numbers (continuous digit sequences) as integers.

Sample Input:
text = "Order123 has 2 items and 45 points"

Expected Output:
[123, 2, 45]
'''

# Approach 1 : using re.findall
import re
text = "Order123 has 2 items and 45 points"
numbers = re.findall(r"[0-9]+", text)
numbers = [int(x) for x in numbers]
print(numbers)

# Approach 2 : manual scan without regex
text = "Order123 has 2 items and 45 points"
numbers = []
current = ""
for ch in text:
    if ch.isdigit():
        current += ch
    else:
        if current:
            numbers.append(int(current))
            current = ""
if current:
    numbers.append(int(current))
print(numbers)
