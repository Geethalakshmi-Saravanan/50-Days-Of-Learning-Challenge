'''
Count names starting with a vowel

Question:
Given a list of names, count how many names start with a vowel (A, E, I, O, U).

Sample Input:
my_list = ["Aishu", "Ilamaran", "Gautham", "Uma", "Elango", "Vinay"]

Expected Output:
4       # Aishu, Ilaamran, Uma, Elango
'''

# Approach 1 : if + multiple startswith
my_list = ["Aishu", "Ilamaran", "Gautham", "Uma", "Elango", "Vinay"]

count = 0
for name in my_list:
    if (name.startswith('A') or name.startswith('E') or
        name.startswith('I') or name.startswith('O') or
        name.startswith('U')):
        count += 1
print(count)

# Approach 2 : using set of vowels
my_list = ["Aishu", "Ilamaran", "Gautham", "Uma", "Elango", "Vinay"]
vowels = {'A', 'E', 'I', 'O', 'U'}
count = sum(1 for name in my_list if name[0] in vowels)
print(count)

