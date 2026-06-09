SELECT 
  e.employeeid,
  e.name AS employee_name,
  m.name AS manager_name,
  COALESCE(m.email, e.email) AS contact_email
FROM employees e
LEFT JOIN employees m
  ON e.managerid = m.employeeid
WHERE e.department = 'Sales';