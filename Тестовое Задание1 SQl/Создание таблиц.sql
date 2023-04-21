CREATE TABLE Department (
ID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Department PRIMARY KEY,
Name nvarchar(100) NOT NULL 
)

CREATE TABLE Employee(
	ID int IDENTITY(1,1) NOT NULL,
	Department_ID int,
	Chief_ID int,
	Name nvarchar(100),
  	Salary int,
	CONSTRAINT PK_Employees PRIMARY KEY (ID),
	CONSTRAINT FK_Employees_DepartmentID FOREIGN KEY(Department_ID) REFERENCES Department(ID),
	CONSTRAINT FK_Employees_ChiefID FOREIGN KEY(Chief_ID) REFERENCES Employee(ID)

)



