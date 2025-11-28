-- Duplicate emails / users with more than one email

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
