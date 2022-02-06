--------Deliverable 1

select e.emp_no,e.first_name,e.last_name,ti.title,ti.from_date,ti.to_date
into retirement_titles
from employees as e inner join titles as ti
on e.emp_no = ti.emp_no
where e.birth_date between '1952-01-01' AND '1955-12-31'
order by e.emp_no

select distinct on (emp_no) emp_no,first_name,last_name,title
into unique_title
from retirement_titles
where to_date = '9999-01-01'
order by emp_no, to_date desc

select count(emp_no),title
into retiring_titles
from unique_title
group by title
order by 1 desc

---Deliverable 2

select distinct on (e.emp_no)e.emp_no,e.first_name,e.last_name,e.birth_date,de.from_date,de.to_date,ti.title
into mentorship_eligibilty
from employees as e inner join dept_emp as de on e.emp_no = de.emp_no
left join titles as ti on ti.emp_no = e.emp_no
where de.to_date = '9999-01-01'
and e.birth_date between '1965-01-01' AND '1965-12-31'
order by e.emp_no