INSERT INTO infosys.employee (emp_id, name, email)
VALUES (12345, 'Soumi', 's123@gmail.com')
ON CONFLICT (emp_id) DO NOTHING;




