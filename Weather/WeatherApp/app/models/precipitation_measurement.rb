class PrecipitationMeasurement
  include Mongoid::Document
  field :STATION, type: String
  field :ELEVATION, type: Integer
  field :LATITUDE, type: Float
  field :LONGITUDE, type: Float
  field :DATE, type: String
  field :YTD_PRECIP_NORM, type: Integer
  field :YTD2013_PRECIP, type: Integer
  field :PRECIP2013_DIFF, type: Integer
  field :YTD2014_PRECIP, type:  Integer
  field :PRECIP2014_DIFF, type: Integer
  field :YTD2015_PRECIP, type: Integer
  field :PRECIP2015_DIFF, type: Integer
end
