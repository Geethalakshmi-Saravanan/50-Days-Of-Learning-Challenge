'''
Names Appearing More Than Once

Question
Given a list of names, create a new list that contains only the names that appear more than once in the original list.
The result must: keep the order of first repeated occurrence, not contain duplicates

Sample Input
names = ["Arjun", "Shalini", "Ajay", "Shalini", "Aditi", "David", "Arjun", "Shalini]

Expected Output
["Arjun", "Shalini"]
'''

# Approach 1 
names = ["Arjun", "Shalini", "Ajay", "Shalini", "Aditi", "David", "Arjun", "Shalini]
result = []
for name in names:
    if names.count(name) > 1 and name not in result:
        result.append(name)
print(result)

# Approach 2 : Counting with dictionary
names = ["Arjun", "Shalini", "Ajay", "Shalini", "Aditi", "David", "Arjun", "Shalini]

# Step 1: Build frequencies
freq = {}
for name in names:
    if name in freq:
        freq[name] += 1
    else:
        freq[name] = 1

# Step 2: Keep only repeat names in order
result = []
for name in names:
    if freq[name] > 1 and name not in result:
        result.append(name)

print(result)
