
create database pro;
use pro;

   CREATE TABLE Owners (
       owner_id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(100),
       contact_info VARCHAR(100)
   );
select * from owners; 

   CREATE TABLE Agents (
       agent_id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(100),
       contact_info VARCHAR(100)
   );

   CREATE TABLE Properties (
       property_id INT AUTO_INCREMENT PRIMARY KEY,
       address VARCHAR(255),
       price DECIMAL(10, 2),
       type ENUM('Residential', 'Commercial', 'Land'),
       status ENUM('Available', 'Sold', 'Rented'),
       owner_id INT,
       FOREIGN KEY (owner_id) REFERENCES Owners(owner_id)
   );
select * from properties;

   CREATE TABLE Sales (
       sale_id INT AUTO_INCREMENT PRIMARY KEY,
       property_id INT,
       agent_id INT,
       sale_date DATE,
       sale_price DECIMAL(10, 2),
       FOREIGN KEY (property_id) REFERENCES Properties(property_id),
       FOREIGN KEY (agent_id) REFERENCES Agents(agent_id)
   );
   select * from sales;

   CREATE TABLE Rentals (
       rental_id INT AUTO_INCREMENT PRIMARY KEY,
       property_id INT,
       tenant_name VARCHAR(100),
       rental_date DATE,
       monthly_rent DECIMAL(10, 2),
       FOREIGN KEY (property_id) REFERENCES Properties(property_id)
   );
   select * from Rentals;
   
   INSERT INTO Owners (name, contact_info) VALUES ('John Doe', 'john@example.com');
   select * from Owners;
   
   INSERT INTO Agents (name, contact_info) VALUES ('Jane Smith', 'jane@example.com');
   select * from Agents;
   
   INSERT INTO Properties (address, price, type, status, owner_id) VALUES 
   ('123 Main St', 300000.00, 'Residential', 'Available', 1);
   
   select * from Properties;
   
   UPDATE Properties SET status = 'Sold' WHERE property_id = 1;
   
   INSERT INTO Sales (property_id, agent_id, sale_date, sale_price) VALUES 
   (1, 1, '2023-10-01', 290000.00);
   select * from Sales;
   
   INSERT INTO Rentals (property_id, tenant_name, rental_date, monthly_rent) VALUES 
   (1, 'Alice Johnson', '2023-10-01', 1500.00);
   select * from Rentals;
   
   SELECT * FROM Properties WHERE status = 'Available';
   
   SELECT * FROM Properties WHERE property_id = 1;
   
    SELECT s.sale_id, p.address, a.name AS agent_name, s.sale_date, s.sale_price 
    FROM Sales s 
    JOIN Properties p ON s.property_id = p.property_id 
    JOIN Agents a ON s.agent_id = a.agent_id;
    
    SELECT type, COUNT(*) AS count FROM Properties GROUP BY type;
    
    SELECT SUM(sale_price) AS total_revenue FROM Sales;

    SELECT * FROM Rentals WHERE property_id = 1;

    SELECT * FROM Properties WHERE owner_id = 1;
