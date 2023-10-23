
1. Write a query to display the customer number, firstname, and customer’s date of birth. Display in sorted order of date of birth year and within that sort by firstname.


SELECT custid, fname, dob
FROM customer
ORDER BY YEAR(dob), fname;


2. Write a query to display the customer’s number, first name, and middle name. For customers who don't have a middle name, display the last name. Give the alias name as Cust_Name.


SELECT custid, fname, COALESCE(mname, ltname) AS Cust_Name
FROM customer;


3. Write a query to display account number, customer’s number, customer’s firstname, lastname, and account opening date.


SELECT acnumber, c.custid, c.fname, c.ltname, aod
FROM account
JOIN customer c ON account.custid = c.custid;


4. Write a query to display the number of customers from Delhi. Give the count an alias name of Cust_Count.


SELECT COUNT(*) AS Cust_Count
FROM customer
WHERE city = 'Delhi';


5. Write a query to display the customer number, customer firstname, and account number for the customers whose accounts were created after the 15th of any month.


SELECT a.custid, c.fname, acnumber
FROM account a
JOIN customer c ON a.custid = c.custid
WHERE DAY(a.aod) > 15;


6. Write a query to display the female customers' firstname, city, and account number who are not into business, service, or studies.


SELECT c.fname, c.city, a.acnumber
FROM customer c
JOIN account a ON c.custid = a.custid
WHERE c.occupation NOT IN ('Business', 'Service', 'Student')
  AND c.mname IS NULL;  -- Assuming that missing middle name indicates "female"


7. Write a query to display city name and the count of branches in that city. Give the count of branches an alias name of Count_Branch.


SELECT bcity AS city, COUNT(*) AS Count_Branch
FROM branch
GROUP BY bcity;


8. Write a query to display account id, customer’s firstname, and customer’s lastname for the customers whose account is Active.


SELECT a.acnumber, c.fname, c.ltname
FROM account a
JOIN customer c ON a.custid = c.custid
WHERE a.astatus = 'Active';


9. Write a query to display the customer’s number, customer’s firstname, branch id, and loan amount for people who have taken loans.


SELECT l.custid, c.fname, l.bid, l.loan_amount
FROM loan l
JOIN customer c ON l.custid = c.custid;


10. Write a query to display customer number, customer name, and account number where the account status is terminated.


SELECT a.custid, CONCAT(c.fname, ' ', COALESCE(c.mname, c.ltname)) AS customer_name, a.acnumber
FROM account a
JOIN customer c ON a.custid = c.custid
WHERE a.astatus = 'Terminated';
