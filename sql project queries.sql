create database hosp_project_da;
use hosp_project_da;
show tables;
select count(*) from fact_bookings;
select count(*) from fact_aggregated_bookings;

-- KPI 1 
select * from fact_bookings;
select sum(revenue_realized) as Revenue from fact_bookings;

-- KPI 2
select count(booking_id) as 'Total Bookings' from fact_bookings;

-- KPI 3
select * from fact_aggregated_bookings;
select sum(capacity) as 'Total Capacity' from fact_aggregated_bookings;

-- KPI 4
select sum(successful_bookings) as 'Total Successful Bookings' from fact_aggregated_bookings;

-- KPI 5 
select avg(adjusted_ratings_given) as average_adjusted_ratings from (select coalesce(ratings_given,null) as adjusted_ratings_given from fact_bookings) as adjusted_ratings_table;
#or
select avg(ratings_given) as 'Average Ratings' from fact_bookings;

-- KPI 6
select(select sum(successful_bookings) from fact_aggregated_bookings) / (select sum(capacity) from fact_aggregated_bookings) as 'Occupancy%';

-- KPI 7
select count(*) as 'Total Cancelled Bookings' from fact_bookings where booking_status = 'cancelled';

-- KPI 8
select(select count(*) from fact_bookings where booking_status = 'cancelled') / (select count(booking_id) from fact_bookings) as 'Cancellation%';

-- KPI 9
select count(booking_id) as 'Total Checked Out' from fact_bookings where booking_status = 'Checked Out';

-- KPI 10
select count(booking_id) as 'Total No Show Bookings' from fact_bookings where booking_status = 'No Show';

-- KPI 11
select(select count(booking_id) from fact_bookings where booking_status = 'No Show') / (select count(booking_id) from fact_bookings) as 'No Show Rate %';

-- KPI 12
select(select sum(revenue_realized) from fact_bookings) / (select count(booking_id) from fact_bookings) as 'ADR';

-- KPI 13
select(select sum(revenue_realized) from fact_bookings) / (select sum(capacity) from fact_aggregated_bookings) as 'RevPAR';

