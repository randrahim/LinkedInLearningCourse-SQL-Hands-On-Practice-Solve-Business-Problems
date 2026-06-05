SELECT 
    employees.employeeid,
    employees.name as employee_name,
    manager.name as manager_name,
    manager.email as manager_email
FROM employees
LEFT JOIN employees manager
ON employees.managerid = manager.employeeid;