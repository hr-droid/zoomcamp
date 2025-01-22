select count(*) from green_taxi_trips 
where trip_distance<=1 
and cast(lpep_dropoff_datetime as date)>='2019-10-01' and 
cast(lpep_dropoff_datetime as date)< '2019-11-01' --104802
;


select count(*) from green_taxi_trips 
where trip_distance<=3 and trip_distance>1 
and cast(lpep_dropoff_datetime as date)>='2019-10-01' and 
cast(lpep_dropoff_datetime as date)< '2019-11-01' --198924
;


select count(*) from green_taxi_trips 
where trip_distance<=7 and trip_distance>3
and cast(lpep_dropoff_datetime as date)>='2019-10-01' and 
cast(lpep_dropoff_datetime as date)< '2019-11-01' --109603
;

select count(*) from green_taxi_trips 
where trip_distance<=10 and trip_distance>7
and cast(lpep_dropoff_datetime as date)>='2019-10-01' and 
cast(lpep_dropoff_datetime as date)< '2019-11-01' --27678
;

select count(*) from green_taxi_trips 
where trip_distance>10
and cast(lpep_dropoff_datetime as date)>='2019-10-01' and 
cast(lpep_dropoff_datetime as date)< '2019-11-01' --35189
;

SELECT
     COUNT(1) AS trip_count
 FROM
     green_taxi_trips
 WHERE
     lpep_dropoff_datetime >= '2019-10-01 00:00:00' AND
     lpep_dropoff_datetime < '2019-11-01 00:00:00' AND trip_distance<=1
	 trip_distance <= 3 and trip_distance > 1;


select * from  green_taxi_trips  limit 2

select lpep_pickup_datetime,max(trip_distance) as mxd from  green_taxi_trips group by lpep_pickup_datetime order by mxd desc;

select "PULocationID",zn."Zone",tm from (select "PULocationID",sum(total_amount) as tm from green_taxi_trips
where cast(lpep_pickup_datetime as date)='2019-10-18'
group by "PULocationID"
)A
left join zones zn 
on A."PULocationID"=zn."LocationID"
order by tm desc;


select dr_zn."Zone",max("tip_amount") as tm
 FROM 
     green_taxi_trips trip
	 join zones zn
	 on trip."PULocationID"=zn."LocationID"
	 join zones dr_zn 
	 on trip."DOLocationID"=dr_zn."LocationID"
 WHERE
     lpep_dropoff_datetime >= '2019-10-01 00:00:00' AND
     lpep_dropoff_datetime < '2019-11-01 00:00:00' 
	 and zn."Zone" ='East Harlem North'
	 group by dr_zn."Zone" order by tm desc

