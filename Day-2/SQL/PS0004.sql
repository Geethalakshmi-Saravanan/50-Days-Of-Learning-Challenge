-- Duplicate emails / users with more than one email

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    email   VARCHAR(100)
);

INSERT INTO users (user_id, email) VALUES
(1, 'aishu@example.com'),
(2, 'gowri@example.com'),
(3, 'aishu@example.com'),   -- duplicate
(4, 'imran@example.com'),
(5, 'gowri@example.com'),   -- duplicate
(6, 'arjun@example.com');

-- A : Emails used by more than one user 
-- Find email addresses that are associated with more than one user.
SELECT
    email,
    COUNT(*) AS user_count
FROM users
GROUP BY email
HAVING COUNT(*) > 1;

-- B : Users having more than one email (if you have user_emails table)
SELECT
    user_id,
    COUNT(*) AS email_count
FROM user_emails
GROUP BY user_id
HAVING COUNT(*) > 1;
