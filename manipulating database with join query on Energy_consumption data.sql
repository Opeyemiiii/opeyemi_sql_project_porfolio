Create database Energy_Consumption
use Energy_Consumption
drop table [dbo].[travel insurance]
select * from building_metadata
select * from weather_train
select * from train

create Table #temp_Database(
site_id int,
building_id int, 
primary_use nvarchar (50),
square_feet int,
year_built int,
floor_count int,
timestamp date,
air_temperature int,
cloud_coverage int,
dew_temperature int,
wind_speed int
)

Insert Into #temp_Database
select building_metadata.site_id, building_metadata.building_id, building_metadata.primary_use, building_metadata.square_feet, building_metadata.year_built,building_metadata.floor_count, weather_train.timestamp, weather_train.air_temperature, weather_train.cloud_coverage,weather_train.dew_temperature,weather_train.wind_speed
from  weather_train
Inner join
building_metadata
On building_metadata.site_id = weather_train.site_id

drop table [dbo].[New_database]
drop table #temp_Database

Select * into
New_database2
from weather_train

select * from #temp_Database
drop database [Energy_Consumption]