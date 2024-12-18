--Q1: Who is the senior most employee based on job title? 

select * from employee
order by levels DESC
limit 1

-- Q2: top 5 countries have the most Invoices?
 
 SELECT count(*) as count , billing_country
 from invoice
 group by billing_country
 order by count desc 
 limit 5
 

 
--Q3: What are top 3 values of total invoice?
 
 select total from invoice
 order by total DESC
 limit 3
 
--Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
--Write a query that returns one city that has the highest sum of invoice totals. 
--Return both the city name & sum of all invoice totals


select sum(total) as s , billing_city
from invoice
group by billing_city
order by s desc
limit 1

--Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
--Write a query that returns the person who has spent the most money.

select customer.customer_id ,customer.first_name , customer.last_name, sum(total) as total
from customer
join invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id
order by total DESC
limit 1 

 -- Q6.Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
--Return your list ordered alphabetically by email starting with A.



SELECT DISTINCT email AS Email,first_name AS FirstName, last_name AS LastName, genre.name AS Name
FROM customer
JOIN invoice ON invoice.customer_id = customer.customer_id
JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
JOIN track ON track.track_id = invoice_line.track_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
ORDER BY email;



-- Q7: Let's invite the artists who have written the most rock music in our dataset. 
--Write a query that returns the Artist name and total track count of the top 10 rock bands.


select * from artist
select * FROM track
select * from genre

SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;


--Q8: Return all the track names that have a song length longer than the average song length. 
--Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.


SELECT name,milliseconds
FROM track
WHERE milliseconds > (
	SELECT AVG(milliseconds) AS avg_track_length
	FROM track )
ORDER BY milliseconds DESC;






