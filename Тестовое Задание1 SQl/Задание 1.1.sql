USE TestDigDes

SELECT ID, Salary
FROM Employee
WHERE Salary = (SELECT MAX(Salary) FROM Employee)
