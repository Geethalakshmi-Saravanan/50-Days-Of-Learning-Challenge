-- 3 consecutive login days using LAG

CREATE TABLE logins (
    id INT PRIMARY KEY,
    user_id INT,
    login_date DATE
);

INSERT INTO logins VALUES
(1, 101, '2025-11-01'),
(2, 101, '2025-11-02'),
(3, 101, '2025-11-03'),
(4, 102, '2025-11-01'),
(5, 102, '2025-11-05');

-- Find users with 3 consecutive login days.
