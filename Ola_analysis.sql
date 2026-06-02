create database ola;
use ola;
select * from ola_cleaned;

#1. Retrive all successful booiking;
create view successful_bookings as
select * from ola_cleaned
where booking_status='success';

#2. Find the average ride distance for each vehicle type
create view avg_ride_distance as
select vehicle_type,avg(ride_distance) from ola_cleaned
group by vehicle_type;

#3.Get the total number of cancelled rides by 
 create view cancel_rides_by_customer as
select  count(*) from ola_cleaned
where booking_status='canceled by customer';

#4.List the top 5 customers who booked the highest number of rides
create view top_5_customers as
select customer_id,count(booking_id) as total_rides from ola_cleaned
group by customer_id
order by total_rides desc
limit 5;

#5.Get the number of rides cancelled by drivers due to personal and car-related issues
create view canceled_by_driver as
select count(*) from ola_cleaned
where canceled_rides_by_Driver='Personal & Car related issue';


#6. Find the maximum and minimum driver ratings for Prime Sedan bookings
create view maX_Min_rating as
select max(driver_ratings) as MAX,min(driver_ratings) as MIN from ola_cleaned
where vehicle_type='prime sedan';

#7. Retrieve all rides where payment was made using UPI
create view Payment_by_UPI as
select * from ola_cleaned
where payment_method='UPI';

#8. Find the average customer rating per vehicle type
create view Cus_AvgRating as
select vehicle_type,avg(customer_rating) as AVGG from ola_cleaned
group by vehicle_type;

#9. Calculate the total booking value of rides completed successfully
create view total_successful_ride as
select sum(booking_value) as total from ola_cleaned
where booking_status='Success';

#10. List all incomplete rides along with the reason
select booking_id ,incomplete_rides_reason from ola_cleaned
where incomplete_rides='YES';



