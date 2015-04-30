class PrecipitationMeasurement
  include Mongoid::Document
  field :STATION, type: String
  field :ELEVATION, type: Integer
  field :LATITUDE, type: Float
  field :LONGITUDE, type: Float
  field :DATE, type: String
  field :YTD_PRECIP_NORM, type: String
  field :YTD2013_PRECIP, type: String
  field :PRECIP2013_DIFF, type: String
  field :YTD2014_PRECIP, type: String
  field :PRECIP2014_DIFF, type: String
  field :YTD2015_PRECIP, type: String
  field :PRECIP2015_DIFF, type: String
end
