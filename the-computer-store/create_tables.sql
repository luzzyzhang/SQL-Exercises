CREATE TABLE Manufacturers (
    Code INTEGER,
    Name VARCHAR(255) NOT NULL,
    PRIMARY KEY (Code)
) ENGINE = INNODB;

CREATE TABLE Products (
    Code INTEGER,
    Name VARCHAR(255) NOT NULL,
    Price DECIMAL NOT NULL,
    Manufacturer INTEGER NOT NULL,
    PRIMARY KEY (Code),
    FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) ENGINE = INNODB;
