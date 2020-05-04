--CREATE THE SCHEMAS--

DROP TABLE departments
DROP TABLE dept_emp
DROP TABLE dept_manager
DROP TABLE employees
DROP TABLE salaries
DROP TABLE titles

CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL
);


CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

CREATE TABLE employees (
    emp_no INT   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    gender VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL
);

CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

CREATE TABLE titles (
    emp_no INT   NOT NULL,
    title VARCHAR   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

--IMPORT THE DATA--
COPY departments
FROM '/tmp/departments.csv'
CSV HEADER;

COPY dept_emp
FROM '/tmp/dept_emp.csv'
CSV HEADER;

COPY dept_manager
FROM '/tmp/dept_manager.csv'
CSV HEADER;

COPY employees
FROM '/tmp/employees.csv'
CSV HEADER;

COPY salaries
FROM '/tmp/salaries.csv'
CSV HEADER;

COPY titles
FROM '/tmp/titles.csv'
CSV HEADER;

--MODIFY THE SCHEMAS A BIT--
ALTER TABLE departments ADD PRIMARY KEY (dept_no);
ALTER TABLE dept_emp ADD PRIMARY KEY (emp_no, dept_no);
ALTER TABLE dept_manager ADD PRIMARY KEY (emp_no, dept_no);
ALTER TABLE salaries ADD PRIMARY KEY (emp_no, salary);
ALTER TABLE employees ADD PRIMARY KEY (emp_no);
ALTER TABLE titles ADD COLUMN id SERIAL PRIMARY KEY;
SELECT * FROM titles

ALTER TABLE salaries
ADD CONSTRAINT fk_constraint FOREIGN KEY (emp_no) REFERENCES employees (emp_no);
ALTER TABLE dept_manager
ADD CONSTRAINT fk_constraint1 FOREIGN KEY (emp_no) REFERENCES employees (emp_no);
ALTER TABLE dept_emp
ADD CONSTRAINT fk_constraint2 FOREIGN KEY (emp_no) REFERENCES employees (emp_no);
ALTER TABLE titles
ADD CONSTRAINT fk_constraint3 FOREIGN KEY (emp_no) REFERENCES employees (emp_no);
ALTER TABLE dept_manager
ADD CONSTRAINT fk_constraint4 FOREIGN KEY (dept_no) REFERENCES departments (dept_no);
ALTER TABLE dept_emp
ADD CONSTRAINT fk_constraint5 FOREIGN KEY (dept_no) REFERENCES departments (dept_no);






