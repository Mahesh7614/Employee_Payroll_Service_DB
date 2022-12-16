-- UC-1
create database Employee_Payroll_Services
use Employee_Payroll_Services

-- UC-2
create table Employee_Payroll
(
	EmployeeID int identity (1,1) not null primary key,
	EmployeeName varchar(40) not null,
	Salary money not null,
	StartDate Date not null
)
select * from Employee_Payroll
exec sp_help 'Employee_Payroll'

-- UC-3
INSERT Into Employee_Payroll (EmployeeName, Salary, StartDate) Values ('Mahesh', 100000, '2018-04-04')
INSERT Into Employee_Payroll (EmployeeName, Salary, StartDate) Values ('Yashwant', 200000, '2019-11-15')
INSERT Into Employee_Payroll (EmployeeName, Salary, StartDate) Values ('Shubhanjli', 300000, '2021-05-20')

-- UC-4
Select * From Employee_Payroll

-- UC-5
Select EmployeeName,Salary From Employee_Payroll Where EmployeeName = 'Mahesh'
Select * From Employee_Payroll Where StartDate BETWEEN CAST('2018-01-01' AS DATE) AND GETDATE()

-- UC-6
ALTER Table Employee_Payroll ADD Gender char(1)
Update Employee_Payroll Set Gender = 'M' Where EmployeeName = 'Mahesh' or EmployeeName = 'Yashwant'
Update Employee_Payroll Set Gender = 'F' Where EmployeeName = 'Shubhanjli'
Update Employee_Payroll Set Salary = 150000 Where EmployeeName = 'Mahesh'
Select * From Employee_Payroll

-- UC-7
Select AVG(Salary) From Employee_Payroll Where Gender = 'M' Group By Gender
Select AVG(Salary) From Employee_Payroll Where Gender = 'F' Group By Gender
Select SUM(Salary) From Employee_Payroll Where Gender = 'M' Group By Gender
Select SUM(Salary) From Employee_Payroll Where Gender = 'F' Group By Gender
Select MIN(Salary) From Employee_Payroll Where Gender = 'M' Group By Gender
Select MIN(Salary) From Employee_Payroll Where Gender = 'F' Group By Gender
Select MAX(Salary) From Employee_Payroll Where Gender = 'M' Group By Gender
Select MAX(Salary) From Employee_Payroll Where Gender = 'F' Group By Gender

-- UC-8
ALTER Table Employee_Payroll ADD Department char(150)
ALTER Table Employee_Payroll ADD PhoneNumber int
ALTER Table Employee_Payroll ADD Address varchar(250)
Update Employee_Payroll Set Department = 'Mechanical' Where EmployeeName = 'Mahesh'
Update Employee_Payroll Set Department = 'Civil' Where EmployeeName = 'Shubhanjli'
Update Employee_Payroll Set Department = 'Electrical' Where EmployeeName = 'Yashwant'
Select * From Employee_Payroll

-- UC-9
Exec sp_rename 'Employee_Payroll.Salary', 'Basic_Pay', 'COLUMN'
ALTER Table Employee_Payroll ADD Deductions money
ALTER Table Employee_Payroll ADD Taxable_Pay money
ALTER Table Employee_Payroll ADD Tax money
ALTER Table Employee_Payroll ADD Net_Pay money
Select * From Employee_Payroll

-- UC-10
INSERT Into Employee_Payroll (EmployeeName, Basic_Pay, StartDate, Gender, Department, Deductions, Taxable_Pay, Tax, Net_Pay) Values ('Shubhanjli', 400000, '2018-01-03', 'F', 'Computer', 100000, 200000, 50000, 300000)
Select * From Employee_Payroll Where EmployeeName = 'Shubhanjli'

-- UC-11
create table Employee_Departments
(
	EmployeeID int not null primary key foreign key references Employee_Payroll(EmployeeID),
	DepartmentId int not null
)
select * from Employee_Departments

INSERT Into Employee_Departments (EmployeeID,DepartmentId) Values (1,205)
INSERT Into Employee_Departments (EmployeeID,DepartmentId) Values (2,201)
INSERT Into Employee_Departments (EmployeeID,DepartmentId) Values (3,204)

Select AVG(Basic_Pay) From Employee_Payroll Where Gender = 'M' Group By Gender
Select AVG(Basic_Pay) From Employee_Payroll Where Gender = 'F' Group By Gender
Select SUM(Basic_Pay) From Employee_Payroll Where Gender = 'M' Group By Gender
Select SUM(Basic_Pay) From Employee_Payroll Where Gender = 'F' Group By Gender
Select MIN(Basic_Pay) From Employee_Payroll Where Gender = 'M' Group By Gender
Select MIN(Basic_Pay) From Employee_Payroll Where Gender = 'F' Group By Gender
Select MAX(Basic_Pay) From Employee_Payroll Where Gender = 'M' Group By Gender
Select MAX(Basic_Pay) From Employee_Payroll Where Gender = 'F' Group By Gender

-- UC-12
Select * From Employee_Payroll
Select EmployeeName,Basic_Pay From Employee_Payroll Where EmployeeName = 'Mahesh'
Select * From Employee_Payroll Where StartDate BETWEEN CAST('2018-01-01' AS DATE) AND GETDATE()
Select AVG(Basic_Pay) From Employee_Payroll Where Gender = 'M' Group By Gender
Select AVG(Basic_Pay) From Employee_Payroll Where Gender = 'F' Group By Gender
Select SUM(Basic_Pay) From Employee_Payroll Where Gender = 'M' Group By Gender
Select SUM(Basic_Pay) From Employee_Payroll Where Gender = 'F' Group By Gender
Select MIN(Basic_Pay) From Employee_Payroll Where Gender = 'M' Group By Gender
Select MIN(Basic_Pay) From Employee_Payroll Where Gender = 'F' Group By Gender
Select MAX(Basic_Pay) From Employee_Payroll Where Gender = 'M' Group By Gender
Select MAX(Basic_Pay) From Employee_Payroll Where Gender = 'F' Group By Gender