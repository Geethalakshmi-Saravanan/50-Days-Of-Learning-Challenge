'''
Count words in a sentence

Question:
Given a sentence, count how many words it contains (assuming words are separated by spaces).

Sample Input:
text = "Aishu is learning SQL and Python with full focus"

Expected Output:
9
'''

# Approach 1 : using split()
text = "Aishu is learning SQL and Python with full focus"
word_count = len(text.split())
print(word_count)

# Approach 2 : manual count
text = "Aishu is learning SQL and Python with full focus"
words = []
current = ""
for ch in text:
    if ch == " ":
        if current:
            words.append(current)
            current = ""
    else:
        current += ch
if current:
    words.append(current)
print(len(words))
