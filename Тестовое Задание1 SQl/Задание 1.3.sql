with sumSalaryTable as(
SELECT dep.Name, SUM(e.Salary) SumSalary
FROM Department as dep
JOIN Employee as e ON dep.ID = e.Department_ID
GROUP BY dep.Name
)


SELECT Name
FROM sumSalaryTable
WHERE SumSalary = (SELECT MAX(SumSalary) FROM sumSalaryTable)



