'''
Count names starting with vowel

Input
names = ["Aishu", "Geetha", "Innaah", "Uma", "Arjun", "Vijay"]

Expected Output
4
'''

names = ["Aishu", "Geetha", "Innaah", "Uma", "Arjun", "Vijay"]
count = 0
vowels = 'aeiouAEIOU'

for i in names:
    if i[0] in vowels:
        count += 1
print(count)
