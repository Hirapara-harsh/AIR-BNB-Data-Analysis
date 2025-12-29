use air_bnb;


-- NOTE : column name "availability_365" changed to "availability"


--- 2.Write a query to show names from Listings table ---

select name
from listings;

--- 3.Write a query to fetch total listings from the listings table ---

select count(id) as total_listings
from listings;

--- 4.Write a query to fetch total listing_id from the booking_details table ---

select count(listing_id) as total_listing_id
from booking_details;

--- 5.Write a query to fetch host ids from listings table ---

select host_id
from listings
order by host_id;

--- 6.Write a query to fetch all unique host name from listings table ---

select distinct(host_name)
from listings;

--- 7.Write a query to show all unique neighbourhood_group from listings table ---

select distinct(neighbourhood_group)
from listings;

--- 8.Write a query to show all unique neighbourhood from listings table ---

select distinct(neighbourhood)
from listings;

--- 9.Write a query to fetch unique room_type from listings tables ---

select distinct(room_type)
from listings;

--- 10.Write a query to show all values of Brooklyn & Manhattan from listings tables ---

select * from listings
where neighbourhood_group in ('Brooklyn', 'Manhattan');

--- 11.Write a query to show maximum price from booking_details table ---

select max(price) as max_price
from booking_details;

--- 12.Write a query to show minimum price fron booking_details table ---

select min(price) as max_price
from booking_details;

--- 13.Write a query to show average price from booking_details table ---

select avg(price) as min_price
from booking_details;

--- 14.Write a query to show minimum value of minimum_nights from booking_details table ---

select min(minimum_nights)
from booking_details;

--- 15.Write a query to show maximum value of minimum_nights from booking_details table ---

select max(minimum_nights)
from booking_details;

--- 16.Write a query to show average availability_365 ---

 select avg(availability)
from booking_details;

--- 17.Write a query to show id , availability_365 and all availability_365 values greater than 300 ---

select listing_id as id,availability
from booking_details
where availability > 300;

--- 18.Write a query to show count of id where price is in between 300 to 400 ---

select COUNT(listing_id) as count_of_ids
from booking_details
where price between 300 and 400;

--- 19.Write a query to show count of id where minimum_nights spend is less than 5 ---

select count(listing_id) as count_of_ids
from booking_details
where minimum_nights < 5;


--- 20.Write a query to show count where minimum_nights spend is greater than 100 ---

select count(listing_id) as count_of_ids
from booking_details
where minimum_nights > 100;


--- 21.Write a query to show all data of listings & booking_details ---

select l.*,b.*
from listings l
join booking_details b 
on l.id = b.listing_id;

--- 22.Write a query to show host name and price ---

select l.host_name,b.price
from listings l
join booking_details b
on l.id=b.listing_id
order by b.price;

--- 23.Write a query to show room_type and price ---

select l.room_type,b.price
from listings l
join booking_details b
on l.id=b.listing_id
order by b.price;

--- 24.Write a query to show neighbourhood_group & minimum_nights spend ---

select l.neighbourhood_group,b.minimum_nights
from listings l
join booking_details b
on l.id=b.listing_id; 


--- 25.Write a query to show neighbourhood & availability_365 ---

select l.neighbourhood_group,b.availability
from listings l
join booking_details b
on l.id=b.listing_id; 

--- 26.Write a query to show total price by neighbourhood_group ---

select sum(b.price) as total_price,l.neighbourhood_group
from listings l
join booking_details b
on l.id=b.listing_id
group by l.neighbourhood_group;

--- 27.Write a query to show maximum price by neighbourhood_group ---

select max(b.price) as max_price,l.neighbourhood_group
from listings l
join booking_details b
on l.id=b.listing_id
group by l.neighbourhood_group;

--- 28.Write a query to show maximum night spend by neighbourhood_group ---

select l.neighbourhood_group,max(b.minimum_nights) as max_minimum_nights
from listings l
join booking_details b 
on l.id = b.listing_id
group by l.neighbourhood_group;

--- 29.Write a query to show maximum reviews_per_month spend by neighbourhood ---

select max(b.reviews_per_month),l.neighbourhood
from listings l
join booking_details b
on l.id=b.listing_id
group by neighbourhood
order by max(b.reviews_per_month) desc;

--- 30.Write a query to show maximum price by room type ---

select max(b.price),l.room_type
from listings l
join booking_details b
on l.id=b.listing_id
group by l.room_type;

--- 31.Write a query to show average number_of_reviews by room_type ---

select avg(b.number_of_reviews),l.room_type
from listings l
join booking_details b
on l.id=b.listing_id
group by l.room_type;

--- 32.Write a query to show average price by room type ---

select avg(b.price),l.room_type
from listings l
join booking_details b
on l.id=b.listing_id
group by l.room_type;

--- 33.Write a query to show average night spend by room type ---

select avg(b.minimum_nights),l.room_type
from listings l
join booking_details b
on l.id=b.listing_id
group by l.room_type;

--- 34.Write a query to show average price by room type but average price is less than 100 ---

select avg(b.price) as avg_price,l.room_type
from listings l
join booking_details b
on l.id=b.listing_id
group by l.room_type
having avg_price<100;

--- 35.Write a query to show average night by neighbourhood and average_nights is greater than 5 ---

select avg(b.minimum_nights) as avg_nights,l.neighbourhood
from listings l
join booking_details b
on l.id=b.listing_id
group by l.neighbourhood
HAVING avg_nights > 5
order by avg_nights;

--- 36.Write a query to show all data from listings where price is greater than 200 using sub-query. ---

select * from listings
where id in(
select listing_id
from booking_details
where price>200
);

--- 37.Write a query to show all values from booking_details table where host id is 314941 using sub-query. ---

select * from booking_details
where listing_id in(
select id 
from listings
where host_id = 314941
);

--- 38.Find all pairs of id having the same host id, each pair coming once only. ---

select distinct(l.id),b.listing_id
from listings l
join booking_details b
on l.id=b.listing_id;

--- 39.Write an sql query to show fetch all records that have the term cozy in name ---

select * from  listings
where name like('%cozy%');

--- 40.Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group ---

select b.price,l.host_id,l.neighbourhood_group
from listings l
join booking_details b
on l.id=b.listing_id
where neighbourhood_group = 'manhattan'
order by b.price,l.host_id;

--- 41.Write a query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood, also make sure price is greater than 100 ---

select l.id,l.host_name,b.price
from listings l
join booking_details b
on l.id=b.listing_id
where l.neighbourhood like('%Upper West Side%') or
l.neighbourhood like ('%Williamsburg%') and
b.price>100;

--- 42.Write a query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant ---

select l.id,l.host_name,l.neighbourhood,b.price
from listings l
join booking_details b
on l.id=b.listing_id
where l.host_name = 'Elise'
and l.neighbourhood = 'Bedford-Stuyvesant';

--- 43.Write a query to show host_name, availability_365,minimum_nights only for 100+ availability_365 and minimum_nights ---

select l.host_name,b.availability,b.minimum_nights
from listings l
join booking_details b
on l.id=b.listing_id
where b.availability>100 and
b.minimum_nights>100;

--- 44.Write a query to show to fetch id , host_name , number_of_reviews, and reviews_per_month but show only that records where number of reviews are 500+ and review per month is 5+ ---

select l.id,l.host_name,b.number_of_reviews,b.reviews_per_month
from listings l
join booking_details b
on l.id=b.listing_id
where number_of_reviews>500 and
reviews_per_month>5;

--- 45.Write a query to show neighbourhood_group which have most total number of review ---

select l.neighbourhood_group,SUM(b.number_of_reviews) as total_reviews
from booking_details b
join listings l
on b.listing_id = l.id
group by l.neighbourhood_group
order by total_reviews desc
limit 1;

--- 46.Write a query to show host name which have most cheaper total price ---

select l.host_name,sum(b.price) as cheap_total_price
from listings l
join booking_details b
on l.id=b.listing_id
group by l.host_name
order by cheap_total_price;

--- 47.Write a query to show host name which have most costly total price ---

select l.host_name,sum(b.price) as total_price
from listings l
join booking_details b
on l.id=b.listing_id
group by l.host_name
order by total_price desc;

--- 48.Write a query to show host name which have max price using sub-query ---

select l.host_name
from listings l
join booking_details b 
on l.id = b.listing_id
where b.price = (
    select MAX(price) 
    from booking_details
);


--- 49.Write a query to show neighbourhood_group where price is less than 100 ---

select l.neighbourhood_group
from listings l
join booking_details b
on l.id=b.listing_id
where b.price<100;

--- 50.Write a query to find max price, average availability_365 for each room type and order in ascending by maximum price. ---

select max(b.price) as max_price,
avg(availability) as avg_availability,
l.room_type
from listings l
join booking_details b
on l.id=b.listing_id
group by l.room_type
order by max_price;