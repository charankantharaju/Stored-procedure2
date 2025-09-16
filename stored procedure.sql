-- Create the employee table with correct default and constraints
create table employee (
  emp_id SERIAL PRIMARY KEY,
  fname VARCHAR(100) NOT NULL,
  lname VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  dept VARCHAR(100),
  salary DECIMAL(10,2) DEFAULT 30000.00,
  hire_date DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Insert 10 sample employee records
INSERT INTO employee (fname, lname, email, dept, salary, hire_date) VALUES
('Vijay', 'Nair', 'vijay.nair@gmail.com', 'Marketing', 50000.00, '2020-04-13'),
('Anita', 'Sharma', 'anita.sharma@gmail.com', 'Finance', 60000.00, '2019-07-21'),
('Raj', 'Kumar', 'raj.kumar@hotmail.com', 'IT', 55000.00, '2021-02-11'),
('Sonal', 'Patel', 'sonal.patel@yahoo.com', 'HR', 48000.00, '2018-11-05'),
('Arjun', 'Reddy', 'arjun.reddy@gmail.com', 'IT', 65000.00, '2022-01-15'),
('Deepa', 'Menon', 'deepa.menon@hotmail.com', 'Marketing', 52000.00, '2020-05-25'),
('Nikhil', 'Gupta', 'nikhil.gupta@gmail.com', 'Finance', 63000.00, '2019-09-12'),
('Ritu', 'Kaur', 'ritu.kaur@yahoo.com', 'HR', 47000.00, '2017-04-18'),
('Suresh', 'Iyer', 'suresh.iyer@gmail.com', 'IT', 54000.00, '2021-10-30'),
('Pooja', 'Singh', 'pooja.singh@gmail.com', 'Finance', 59000.00, '2018-08-22');

-- Create or replace procedure to update employee salary
create or replace procedure update_emp_salary(
  p_employee_id int,
  p_salary numeric
)
language plpgsql
as $$
begin
  update employee
  set salary = p_salary
  where emp_id = p_employee_id;
end;
$$
-- Call the procedure to update salary for employee with emp_id = 3
CALL update_emp_salary(3, 71000);
call update_emp_salary(2, 39000);
-- Verify updated data
select * from employee;
order by emp_id asc 











create or replace procedure update_salary_emp(
p_emp_id int,
p_salary numeric
)
language plpgsql 
as
$$
begin 
update employee 
set salary = p_salary
where emp_id = p_emp_id ;
end;
$$;
call update_salary_emp (1,39999)
select * from employee;


-- adding new employee 

create or replace procedure add_new_emp(
p_fname varchar(100),
p_lname varchar(100), 
p_email varchar(100),
p_dept varchar(100),
p_salary numeric 
)
language plpgsql
as 
$$
begin 
insert into employee (fname,lname,email,dept,salary)
values (p_fname , p_lname , p_email,p_dept ,p_salary);
end ;
$$;

call add_new_emp ('ab','d','abd2gmail.com','cricket',8988897);
select * from employee 