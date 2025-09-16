select * from employee

create or replace procedure ad_em(
p_fname varchar (100),
p_lname varchar (100),
p_email varchar (100),
p_dept varchar (100),
p_salary numeric 
)
language plpgsql
as 
$$
begin 
insert into employee (fname, lname, email, dept, salary)
values (p_fname, p_lname, p_email, p_dept,p_salary);
end ;
$$;

call ad_em ('keerthi','kumar','kk@gmail.com','CA',87000)

select * from employee
