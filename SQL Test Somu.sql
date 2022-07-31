# Imarticus SQL Exam 31 July 2022
# 811719104095 Somasundaram S


#que num 1. Write a SQL query which will sort out the customer and their grade who made an order. Every customer must have a grade and be served by at least one seller, who belongs to a region.

SELECT customer.cust_name AS "Customer", customer.grade AS "Grade",orders.ord_no AS "Order No."
FROM orders, salesman, customer WHERE orders.customer_id=customer.custemor_id
AND orders.salesman_id=salesman.salesman_id
AND salesman.city IS NOT NULL
AND customer.grade IS NOT NULL;


# que num 2 : Write a query for extracting the data from the order table for the salesman who earned the maximum commission.

SELECT ord_no, purch_amt, ord_date, salesman_id FROM orders 
WHERE salesman_id IN( SELECT salesman_id FROM salesman WHERE commision = (SELECT MAX(commision) FROM salesman));


# que num 3 : From orders retrieve only ord_no, purch_amt, ord_date, ord_date, salesman_id where salesman’s city is Nagpur(Note salesman_id of orderstable must be other than the list within the IN operator.)

SELECT ord_no, purch_amt, ord_date, salesman_id FROM orders WHERE salesman_id IN
    (SELECT salesman_id 
     FROM salesman 
     WHERE city='nagpur');
    
	
# que no. 4: Write a query to create a report with the order date in such a way that the latest order date will come last along with the total purchase amount and the total commission for that date is (15 % for all sellers).

SELECT ord_date, SUM(purch_amt), SUM(purch_amt)*.15 FROM orders 
GROUP BY ord_date 
ORDER BY ord_date ASC;


# que num 5: Retrieve ord_no, purch_amt, ord_date, ord_date, salesman_id from Orders table and display only those sellers whose purch_amt is greater than average purch_amt.

SELECT ord_no, purch_amt, ord_date, salesman_id FROM orders WHERE purch_amt >(SELECT  AVG(purch_amt) FROM orders );


# que num 6: Write a query to determine the Nth (Say N=5) highest purch_amt from Orders table.

select * from orders ORDER BY purch_amt desc limit 4,1;


# que num 7: What are Entities and Relationships?

# Entities : An entity is a real-world object. 
# A university database can have entities such as Student, Lecturer, Course, Project, etc. In a DBMS, these entities are the tables.
# The attributes describe the entities. The student entity can have attributes such as id and name. 
# The course entity can have attributes such as course_code and course_name. The Lecturer can have attributes such as id, name and speciality.

# Relationships : A relationship signifies an association among the entities. There are three types of relationships that can exist between the entities. They are the binary, recursive and the ternary relationship.
# When one instance of an entity is associated with one instance of another type of entity, it is called one to one (1:1) relationship
# When one instance of an entity is associated with many instances of another type of entity, it is called one to many (1: m) relationship.
# When many instances of an entity are associated with many instances of another type of entity, it is called many to many (m : n) relationship.
# when an entity is related to itself, it is called a recursive relationship.


# que num 8: Print customer_id, account_number and balance_amount, condition that if balance_amount is nil then assign transaction_amount for account_type = "Credit Card"

Select Customer_id , ba.Account_Number,
Case when ifnull(Balance_amount,0) = 0 then   Transaction_amount else Balance_amount end  as Balance_amount
from bank_account_details ba inner join bank_account_transaction bat on ba.Account_Number = bat.Account_Number and Account_type = "Credit Card";


# que num 9: Print customer_id, account_number, balance_amount, conPrint account_number, balance_amount, transaction_amount from Bank_Account_Details and bank_account_transaction for all the transactions occurred during march, 2020 and april, 2020.

Select ba.Customer_id, ba.Account_Number, Balance_amount, Transaction_amount, Transaction_Date
from bank_account_details ba inner join bank_account_transaction bat on ba.Account_Number = bat.Account_Number
And 
( Transaction_Date between "2020-03-01" and "2020-04-30");
 

# que num 10: Print all of the customer id, account number, balance_amount, transaction_amount from bank_cutomer, bank_account_details and bank_account_transactions tables where excluding all of their transactions in march, 2020 month .

Select ba.Customer_id, ba.Account_Number, Balance_amount, Transaction_amount, Transaction_Date
from bank_account_details ba  Left join bank_account_transaction bat on ba.Account_Number = bat.Account_Number
And NOT 
(Transaction_Date between "2020-03-01" and "2020-03-31");

