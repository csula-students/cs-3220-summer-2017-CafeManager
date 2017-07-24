CREATE TABLE FoodItems(
    ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(255) NOT NULL,
    Price FLOAT
    );

CREATE TABLE OrdersStatus(
    ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    Created DATETIME NOT NULL
    );

CREATE TABLE OrderedFood(
    OrderID INTEGER REFERENCES OrdersStatus(ID),
    FoodID INTEGER REFERENCES FoodItems(ID),
    Quantity INTEGER REFERENCES ShoppingCart(Quantity)
    );

CREATE TABLE ShoppingCart(
    ID INTEGER,
    CustomerName VARCHAR(255) NOT NULL,
    FoodID INTEGER NOT NULL,
    Quantity INTEGER NOT NULL
    );


INSERT INTO FoodItems(ID, Name, Description, Price) VALUES (1, 'Hamburger', 'A Hamburger', 9.99),
					 (2, 'Fries', 'Some fries', 4.99), (3, 'Coke', 'Coke cola', 2.99);

INSERT INTO OrdersStatus(ID, CustomerName, Created) VALUES (1, 'Eric', '2017-07-20 13:35:55'), (2, 'John', '2017-07-22 10:35:55'),
															(3, 'Jane', '2017-07-22 15:35:55'), (4, 'Alice', '2017-07-22 16:35:55');
INSERT INTO ShoppingCart(ID, CustomerName, FoodID, Quantity) VALUES (1, 'Anonymous', 1, 2), (1, 'Anonymous', 2, 1),
															(1, 'Anonymous', 2, 1), (2, 'Mike', 1, 1), (2, 'Mike', 1, 1), (3, 'Bob', 3, 1);


 UPDATE FoodItems SET Name = 'Salad' WHERE Name = 'Hamburger';
 
 UPDATE OrdersStatus SET CustomerName = 'Doe' WHERE CustomerName = 'Jane';
 
 SELECT * FROM ShoppingCart;
SELECT Name, SUM(Quantity)FROM ShoppingCart b JOIN FoodItems a ON(a.ID = b.ID) GROUP BY Name ORDER BY FoodID ASC LIMIT 1 ;
SELECT Name, SUM(Quantity)FROM ShoppingCart b JOIN FoodItems a ON(a.ID = b.ID) GROUP BY Name ORDER BY FoodID DESC LIMIT 1 ;  
 SELECT Name FROM FoodItems;
 SELECT * FROM OrdersStatus;
 SELECT * FROM OrdersStatus WHERE Created = NOW();
 
 DELETE FROM FoodItems;
 DELETE FROM OrdersStatus;
 DELETE FROM ShoppingCart;
