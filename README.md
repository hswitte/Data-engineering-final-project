# Data-engineering-final-project
### Dependencies
 - Ruby (2.2.2)
 - Rails (4.2.1)
 - Gems located in Gemfile within the WeatherApp
 - MongoDB


### Configuration for local machine:
 - Clone the repo onto your machine
 - Start an instance of Mongo (for my Arch setup this is done by ```systemctl start mongodb```)
 - cd into Weather/WeatherApp
 - Import the CSV file into mongo using the following command
   - ```mongoimport -c precipitation_measurements -d weather_development --type=csv --headerline ../final_climate_data.csv```
 - Start the rails server
 - Navigate to http://localhost:3000/precipitation_measurements to see the data stored in mongo at this time
 - CRUD operations through the rails interface or rails console
 - Can also be used as an API by appending .json to the end of the URL:
   - http://localhost:3000/precipitation_measurements.json
   - 
   
###A note about the data:
- All data was collected from NOAA (https://www.ncdc.noaa.gov/cdo-web/datasets)
- python scripts were used to trim and clean up the data provided by NOAA 
