create database ola;
use ola;
select * from booking ;

#1. Retrieve all successful bookings:

create view successful_booking as
select * from booking where booking_status="success";

select * from successful_booking ;


#2. Find the average ride distance for each vehicle type:

select vehicle_type ,avg(ride_distance)AS AVG_distance from booking group by vehicle_type ;

#3. Get the total number of canceled rides by customers:
select count(*)from booking 
where booking_status="Canceled by Customer";

create view canceled_rides_by_customers as
select count(*)from booking 
where booking_status="Canceled by Customer";

select * from canceled_rides_by_customers ;

#4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select customer_id ,count(booking_id) as total_ride 
from booking 
group by customer_id 
order by total_ride desc limit 5;

select * from top_5_customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:

select count(*)from booking 
where Canceled_Rides_by_Driver = "Personal & Car related issue";

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

select max(Driver_Ratings) as max_rating , min(Driver_Ratings)as min_rating 
from booking where vehicle_type = "prime sedan";


#7. Retrieve all rides where payment was made using UPI:

select * from booking where Payment_Method = "UPI";

#8. Find the average customer rating per vehicle type:

select vehicle_type ,avg(customer_rating) as avg_rating from booking 
group by vehicle_type;

#9. Calculate the total booking value of rides completed successfully:

select sum(booking_value) as total_successful_value  from successful_booking;

#10. List all incomplete rides along with the reason:

select booking_id, Incomplete_Rides_Reason from booking where Incomplete_Rides = "yes";
