create database ola;
use ola;

create view Successfull_Bookings as
 select * from bookings
 where Booking_Status = 'Success';

 #1. Retrieve all successful bookings			
 select * from Successfull_Bookings;
 
#2. Find the average ride distance for each vehicle type
	create view ride_distance_for_each_vehicle as
    select Vehicle_Type, avg(Ride_Distance)
    as avg_distance from bookings
    group by Vehicle_Type;
    
    select * from ride_distance_for_each_vehicle;
   
 #3. Get the total number of canceled rides by customers
 create view canceled_rides_by_customers as
 select count(*) from bookings
 where Booking_Status = 'Canceled by Customer';
 
 select * from canceled_rides_by_customers;
 
 #4. List the top 5 customers who booked the highest number of rides
create view Top_5_Customers as
select Customer_ID, count(Booking_ID) as total_rides
from bookings
group by Customer_ID
order by total_rides desc limit 5;

select * from  Top_5_Customers;

 #5. Get the number of rides cancelled by drivers due to personal and car-related issues
 create view  Canceled_rides_by_driver_P_C_issues as
 select count(*) from bookings
 where Canceled_rides_by_driver = 'Personal &  Car related issue';
 
  #6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 create view Max_Min_driver_Rating as
 SELECT MAX(Driver_Ratings) as Max_Rating, MIN(Driver_Ratings) as Min_Rating
 FROM bookings
 WHERE Vehicle_Type = 'Prime Sedan';
 
 select * from Max_Min_driver_Rating;
 
  #7. Retrieve all rides where payment was made using UPI
 create view UPI_Payment as
 select * from bookings  
 where Payment_Method = 'UPI';
 
  #8. Find the average customer rating per vehicle type
create view AVG_Customer_Rating_per_Vehicle as
 select Vehicle_Type, avg(Customer_Rating)  as avg_customer_rating
 from bookings
 group by Vehicle_Type;
 
 #9. Calculate the total booking value of rides completed successfully
create view total_successful_booking_value as
SELECT SUM(Booking_Value) as total_successful_ride_value
 FROM bookings
 WHERE Booking_Status = 'Success';
 
 
#10. List all incomplete rides along with the reason
create view incomplete_ride_reason as  
  SELECT Booking_ID, Incomplete_Rides_Reason
 FROM bookings
 WHERE Incomplete_Rides = 'Yes';
 
 #SQL queries Answers:
 
  #1. Retrieve all successful bookings			
 select * from Successfull_Bookings;
 
 #2. Find the average ride distance for each vehicle type
 select * from ride_distance_for_each_vehicle;
 
  #3. Get the total number of canceled rides by customers
select * from canceled_rides_by_customers;
	
 #4. List the top 5 customers who booked the highest number of rides 
 select * from  Top_5_Customers;
 
 #5. Get the number of rides cancelled by drivers due to personal and car-related issues
 select * from Canceled_rides_by_driver_P_C_issues;
 
 #6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 select * from Max_Min_driver_Rating;
 
  #7. Retrieve all rides where payment was made using UPI
  select * from UPI_Payment;
  
  #8. Find the average customer rating per vehicle type
  select * from AVG_Customer_Rating_per_Vehicle;
  
  #9. Calculate the total booking value of rides completed successfully
 select * from  total_successful_booking_value;
 
#10. List all incomplete rides along with the reason 
select * from incomplete_ride_reason;