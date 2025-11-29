# 📘 Day 4 – SQL & Python Problem Solving
---

## ✅ Topics Covered
- SQL Window Functions (LAG, ROW_NUMBER, DENSE_RANK, SUM OVER)
- Date difference logic
- Monthly ranking logic
- Above-average filtering
- Running totals (cumulative sum)
- Python list pattern recognition
- Frequency-based filtering
- Consecutive streak detection

---

# 🟦 SQL Problems (6 Total)

### **Problem 1 – Consecutive 3-Day Orders**
**Concepts:** LAG, DATEDIFF, window ordering  
**Goal:** Identify users who placed orders on 3 consecutive days.

---

### **Problem 2 – Top 2 Highest Amounts per User**
**Concepts:** DENSE_RANK, partitioning, top-N filter  
**Goal:** Return the top 2 order amounts for each user.

---

### **Problem 3 – Above-Average Sales per Day**
**Concepts:** AVG OVER, daily grouping  
**Goal:** Get products where amount > average amount for that sale_date.

---

### **Problem 4 – Days Since Previous Successful Transaction**
**Concepts:** ROW_NUMBER, LAG, date differences  
**Goal:** For each user, compute days since their previous successful txn.

---

### **Problem 5 – Monthly Top 2 Users by Total Amount**
**Concepts:** SUM OVER, ranking per month  
**Goal:** Find the top 2 users by monthly total spending.

---

### **Problem 6 – First Date When Cumulative Purchase ≥ 1000**
**Concepts:** Running SUM OVER, HAVING  
**Goal:** For each user, identify first date where running_total ≥ 1000.

---

# 🟩 Python Problems (6 Total)

### **Problem 1 – Count Words in a Sentence**
**Concepts:** split(), length calculation  
**Goal:** Count words in a given string.

---

### **Problem 2 – Extract Numbers from a String**
**Concepts:** Looping, digit checks  
**Goal:** Extract all numbers or numeric sequences.

---

### **Problem 3 – Maximum Frequency of a Number**
**Concepts:** Nested loops, occurrence counting  
**Goal:** Find highest occurrence count of any number.

---

### **Problem 4 – Cumulative Sum List**
**Concepts:** Running total  
**Goal:** Generate cumulative sum list from input list.

---

### **Problem 5 – Names Appearing More Than Once**
**Concepts:** Frequency counting, avoiding duplication  
**Goal:** List names that appear more than once, preserving order.

---

### **Problem 6 – Longest Steps Streak ≥ 8000**
**Concepts:** Streak tracking, max streak  
**Goal:** Find longest consecutive streak where steps ≥ 8000.

---

## ⭐ Key Learnings Today
- Tracking “current streak” vs “max streak”
- Understanding window functions clearly (LAG / RANK / SUM OVER)
- Using partition + ordering for pattern-based SQL
- Cumulative logic in both SQL and Python
- Pattern recognition for list operations in Python
