SELECT * FROM business.dataanalyst_assesment_dataset;
rename table dataanalyst_assesment_dataset to bookings;

desc bookings;
UPDATE bookings 
SET booking_date = STR_TO_DATE(booking_date, '%m/%d/%Y')
WHERE booking_date IS NOT NULL;
update bookings set Duration_mins=Trim(Duration_mins);
update bookings set Duration_mins= null where Duration_mins='';

alter table bookings modify column Customer_Phone varchar(60);

select date_format(booking_date,'%Y%M') as month, sum(price) as total_revenue
from bookings where status='confirmed' 
group by month
Order by month;

select booking_type, count(*) as total_bookings 
from bookings
group by booking_type
order by booking_type desc;

select customer_name, sum(price) as total_spent
from bookings
where status='confirmed'
group by customer_name
order by total_spent 
limit 10;

select time_slot, count(*) as total_bookings
from bookings
where status='confirmed'
group by time_slot 
order by total_bookings DESC;

select booking_type, avg(duration_mins) as avg_duration
from bookings
group by booking_type
order by avg_duration;







