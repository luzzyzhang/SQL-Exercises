--4. Select all the products with a price between $60 and $120.
/* With AND */
 SELECT * FROM Products
   WHERE Price >= 60 AND Price <= 120;
 
 /* With BETWEEN */
  SELECT * FROM Products
   WHERE Price BETWEEN 60 AND 120;


--9. Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT Name, Price 
    FROM Products
    WHERE Price >= 180
    ORDER BY Price DESC, Name;


--10. Select all the data from the products, including all the data for each product's manufacturer.
/* Without INNER JOIN */
 SELECT * FROM Products, Manufacturers
   WHERE Products.Manufacturer = Manufacturers.Code;

 /* With INNER JOIN */
 SELECT *
   FROM Products INNER JOIN Manufacturers
   ON Products.Manufacturer = Manufacturers.Code;


--11. Select the product name, price, and manufacturer name of all the products.


 /* Without INNER JOIN */
 SELECT Products.Name, Price, Manufacturers.Name
   FROM Products, Manufacturers
   WHERE Products.Manufacturer = Manufacturers.Code;

 /* With INNER JOIN */
 SELECT Products.Name, Price, Manufacturers.Name
   FROM Products INNER JOIN Manufacturers
   ON Products.Manufacturer = Manufacturers.Code;


--12. Select the average price of each manufacturer's products, showing only the manufacturer's code.

SELECT AVG(Price), Manufacturer
    FROM Products
GROUP BY Manufacturer;


--13. Select the average price of each manufacturer's products, showing the manufacturer's name.


/* Without INNER JOIN */
 SELECT AVG(Price), Manufacturers.Name
   FROM Products, Manufacturers
   WHERE Products.Manufacturer = Manufacturers.Code
   GROUP BY Manufacturers.Name;
 
 /* With INNER JOIN */
 SELECT AVG(Price), Manufacturers.Name
   FROM Products INNER JOIN Manufacturers
   ON Products.Manufacturer = Manufacturers.Code
   GROUP BY Manufacturers.Name;


--14. Select the names of manufacturer whose products have an average price larger than or equal to $150.

 /* Without INNER JOIN */
 SELECT AVG(Price), Manufacturers.Name
   FROM Products, Manufacturers
   WHERE Products.Manufacturer = Manufacturers.Code
   GROUP BY Manufacturers.Name
   HAVING AVG(Price) >= 150;
 
 /* With INNER JOIN */
 SELECT AVG(Price), Manufacturers.Name
   FROM Products INNER JOIN Manufacturers
   ON Products.Manufacturer = Manufacturers.Code
   GROUP BY Manufacturers.Name
   HAVING AVG(Price) >= 150;


--15. Select the name and price of the cheapest product.

SELECT name,price
  FROM Products
  ORDER BY price ASC
  LIMIT 1

/* With a nested SELECT */
 SELECT Name, Price
   FROM Products
   WHERE Price = (SELECT MIN(Price) FROM Products);


--16. Select the name of each manufacturer along with the name and price of its most expensive product.

SELECT Products.Name, MAX(Price), Manufacturers.Name
 FROM Products, Manufacturers
 WHERE Manufacturer = Manufacturers.Code
 GROUP BY Manufacturers.Name;

 /* With a nested SELECT and without INNER JOIN */
   SELECT A.Name, A.Price, F.Name
   FROM Products A, Manufacturers F
   WHERE A.Manufacturer = F.Code
     AND A.Price =
     (
       SELECT MAX(A.Price)
         FROM Products A
         WHERE A.Manufacturer = F.Code
     );
 
 /* With a nested SELECT and an INNER JOIN */
   SELECT A.Name, A.Price, F.Name
   FROM Products A INNER JOIN Manufacturers F
   ON A.Manufacturer = F.Code
     AND A.Price =
     (
       SELECT MAX(A.Price)
         FROM Products A
         WHERE A.Manufacturer = F.Code
     );

--17. Add a new product: Loudspeakers, $70, manufacturer 2.

INSERT INTO Products( Name , Price , Manufacturer)
  VALUES ( 'Loudspeakers' , 70 , 2 );


--18. Update the name of product 8 to "Laser Printer".

UPDATE Products
   SET Name = 'Laser Printer'
   WHERE Code = 8;


--19. Apply a 10% discount to all products.

UPDATE Products
   SET Price = Price * 0.9;
