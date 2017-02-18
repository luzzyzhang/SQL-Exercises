CREATE TABLE Departments (
      Code INTEGER PRIMARY KEY,
      Name varchar(255) NOT NULL ,
      Budget decimal NOT NULL 
);

CREATE TABLE Employees (
      SSN INTEGER PRIMARY KEY,
      Name varchar(255) NOT NULL ,
      LastName varchar(255) NOT NULL ,
      Department INTEGER NOT NULL , 
      foreign key (department) references Departments(Code) 
) ENGINE=INNODB;
