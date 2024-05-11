-- List the number of films per category.
SELECT CATEGORY_ID, COUNT(FILM_ID)
FROM SAKILA.FILM_CATEGORY
GROUP BY 1;

-- Display the first and the last names, as well as the address, of each staff member.
SELECT S.FIRST_NAME, S.LAST_NAME, A.ADDRESS
FROM SAKILA.STAFF S
LEFT JOIN SAKILA.ADDRESS A  
ON S.ADDRESS_ID = A.ADDRESS_ID;

-- Display the total amount rung up by each staff member in August 2005.
SELECT STAFF_ID, SUM(AMOUNT) AS TOTAL_AMOUNT
FROM SAKILA.PAYMENT
WHERE EXTRACT(MONTH FROM PAYMENT_DATE) = 8 AND EXTRACT(YEAR FROM PAYMENT_DATE) = 2005
GROUP BY 1;

-- List all films and the number of actors who are listed for each film.
SELECT FI.TITLE, COUNT(A.ACTOR_ID)
FROM SAKILA.FILM FI
LEFT JOIN SAKILA.FILM_ACTOR FA
ON FA.FILM_ID = FI.FILM_ID
LEFT JOIN SAKILA.ACTOR A
ON A.ACTOR_ID = FA.ACTOR_ID
GROUP BY 1;

-- Using the payment and the customer tables as well as the JOIN command, list the total amount 
-- paid by each customer. List the customers alphabetically by their last names.

SELECT C.CUSTOMER_ID, C.LAST_NAME, C.FIRST_NAME, SUM(P.AMOUNT) AS TOTAL_AMOUNT_PAID
FROM CUSTOMER C
JOIN SAKILA.PAYMENT P ON C.CUSTOMER_ID = P.CUSTOMER_ID
GROUP BY 1, 2, 3
ORDER BY 2, 3;

