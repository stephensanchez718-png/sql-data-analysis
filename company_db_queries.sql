CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50)
);

CREATE TABLE LoginLogs (
    log_id SERIAL PRIMARY KEY,
    user_id INT,
    login_time TIMESTAMP,
    status VARCHAR(20)
);

CREATE TABLE Tickets (
    ticket_id SERIAL PRIMARY KEY,
    user_id INT,
    issue VARCHAR(255),
    status VARCHAR(50)
);
INSERT INTO Users (name, department) VALUES
('John Doe', 'IT'),
('Jane Smith', 'HR'),
('Mike Brown', 'Sales'),
('Emily Davis', 'IT'),
('Chris Wilson', 'HR'),
('Anna Taylor', 'Sales'),
('David Lee', 'IT'),
('Sophia Clark', 'HR'),
('Daniel Hall', 'Sales'),
('Olivia Young', 'IT');
INSERT INTO LoginLogs (user_id, login_time, status) VALUES
(1, NOW(), 'Success'),
(2, NOW(), 'Failed'),
(3, NOW(), 'Success'),
(4, NOW(), 'Failed'),
(5, NOW(), 'Success'),
(6, NOW(), 'Failed'),
(7, NOW(), 'Success'),
(8, NOW(), 'Success'),
(9, NOW(), 'Failed'),
(10, NOW(), 'Success');
INSERT INTO Tickets (user_id, issue, status) VALUES
(1, 'Password reset', 'Open'),
(2, 'Network issue', 'Closed'),
(3, 'Software install', 'Open'),
(4, 'Access denied', 'Closed'),
(5, 'Email issue', 'Open');
INSERT INTO Users (name, department) VALUES
('John Doe', 'IT'),
('Jane Smith', 'HR'),
('Mike Brown', 'Sales'),
('Emily Davis', 'IT'),
('Chris Wilson', 'HR'),
('Anna Taylor', 'Sales'),
('David Lee', 'IT'),
('Sophia Clark', 'HR'),
('Daniel Hall', 'Sales'),
('Olivia Young', 'IT');
INSERT INTO LoginLogs (user_id, login_time, status) VALUES
(1, NOW(), 'Success'),
(2, NOW(), 'Failed'),
(3, NOW(), 'Success'),
(4, NOW(), 'Failed'),
(5, NOW(), 'Success'),
(6, NOW(), 'Failed'),
(7, NOW(), 'Success'),
(8, NOW(), 'Success'),
(9, NOW(), 'Failed'),
(10, NOW(), 'Success');
INSERT INTO Tickets (user_id, issue, status) VALUES
(1, 'Password reset', 'Open'),
(2, 'Network issue', 'Closed'),
(3, 'Software install', 'Open'),
(4, 'Access denied', 'Closed'),
(5, 'Email issue', 'Open');
SELECT * FROM Users;
SELECT * FROM LoginLogs;
SELECT * FROM Tickets;
SELECT * FROM Users;
SELECT department, COUNT(*) AS total_users
FROM Users
GROUP BY department;
DELETE FROM Users;
INSERT INTO Users (name, department) VALUES
('John Doe', 'IT'),
('Jane Smith', 'HR'),
('Mike Brown', 'Sales'),
('Emily Davis', 'IT'),
('Chris Wilson', 'HR'),
('Anna Taylor', 'Sales'),
('David Lee', 'IT'),
('Sophia Clark', 'HR'),
('Daniel Hall', 'Sales'),
('Olivia Young', 'IT');
SELECT COUNT(*) FROM Users;
SELECT department, COUNT(*) AS total_users
FROM Users
GROUP BY department;
SELECT status, COUNT(*) AS total_attempts
FROM LoginLogs
GROUP BY status;
SELECT COUNT(*) FROM LoginLogs;
INSERT INTO LoginLogs (user_id, login_time, status) VALUES
(1, NOW(), 'Success'),
(2, NOW(), 'Failed'),
(3, NOW(), 'Success'),
(4, NOW(), 'Failed'),
(5, NOW(), 'Success'),
(6, NOW(), 'Failed'),
(7, NOW(), 'Success'),
(8, NOW(), 'Success'),
(9, NOW(), 'Failed'),
(10, NOW(), 'Success');
SELECT * FROM LoginLogs;
SELECT status, COUNT(*) AS total_attempts
FROM LoginLogs
GROUP BY status;
SELECT U.department, COUNT(T.ticket_id) AS total_tickets
FROM Users U
JOIN Tickets T ON U.user_id = T.user_id
GROUP BY U.department;
SELECT COUNT(*) FROM Tickets;
INSERT INTO Tickets (user_id, issue, status) VALUES
(1, 'Password reset', 'Open'),
(2, 'Network issue', 'Closed'),
(3, 'Software install', 'Open'),
(4, 'Access denied', 'Closed'),
(5, 'Email issue', 'Open');
SELECT * FROM Tickets;
SELECT U.department, COUNT(T.ticket_id) AS total_tickets
FROM Users U
JOIN Tickets T ON U.user_id = T.user_id
GROUP BY U.department;
INSERT INTO LoginLogs (user_id, login_time, status)
SELECT 
    (RANDOM()*9 + 1)::INT,
    NOW(),
    CASE 
        WHEN RANDOM() > 0.3 THEN 'Success'
        ELSE 'Failed'
    END
FROM generate_series(1, 200);
SELECT COUNT(*) FROM LoginLogs;
SELECT user_id, COUNT(*) AS failed_attempts
FROM LoginLogs
WHERE status = 'Failed'
GROUP BY user_id
ORDER BY failed_attempts DESC;