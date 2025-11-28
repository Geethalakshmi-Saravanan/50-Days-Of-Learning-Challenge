'''
Names starting with ‘A’

Question:
From a list of names, return only the names that start with the letter 'A'.

Sample Input:
my_list = ["Aishu", "Geetha", "Arjun", "Vijay", "Aditi", "Saravanan"]

Expected Output:
["Aishu", "Arjun", "Aditi"]
'''

# Approach 1 
my_list =  ["Aishu", "Geetha", "Arjun", "Vijay", "Aditi", "Saravanan"]
a_list = []
for name in my_list:
    if name[0] == 'A':
        a_list.append(name)
print(a_list)

# Approach 2 : startswith + comprehension
my_list =  ["Aishu", "Geetha", "Arjun", "Vijay", "Aditi", "Saravanan"]
a_list = [name for name in my_list if name.startswith('A')]
print(a_list)
