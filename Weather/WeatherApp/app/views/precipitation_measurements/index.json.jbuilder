json.array!(@precipitation_measurements) do |precipitation_measurement|
  json.extract! precipitation_measurement, :id, :STATION, :ELEVATION, :LATITUDE, :LONGITUDE, :DATE, :YTD_PRECIP_NORM, :YTD2013_PRECIP, :PRECIP2013_DIFF, :YTD2014_PRECIP, :PRECIP2014_DIFF, :YTD2015_PRECIP, :PRECIP2015_DIFF
  json.url precipitation_measurement_url(precipitation_measurement, format: :json)
end
