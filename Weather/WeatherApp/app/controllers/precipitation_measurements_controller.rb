class PrecipitationMeasurementsController < ApplicationController
  before_action :set_precipitation_measurement, only: [:show, :edit, :update, :destroy]

  # GET /precipitation_measurements
  # GET /precipitation_measurements.json
  def index
    @precipitation_measurements = PrecipitationMeasurement.all
  end

  # GET /precipitation_measurements/1
  # GET /precipitation_measurements/1.json
  def show
  end

  # GET /precipitation_measurements/new
  def new
    @precipitation_measurement = PrecipitationMeasurement.new
  end

  # GET /precipitation_measurements/1/edit
  def edit
  end

  # POST /precipitation_measurements
  # POST /precipitation_measurements.json
  def create
    @precipitation_measurement = PrecipitationMeasurement.new(precipitation_measurement_params)

    respond_to do |format|
      if @precipitation_measurement.save
        format.html { redirect_to @precipitation_measurement, notice: 'Precipitation measurement was successfully created.' }
        format.json { render :show, status: :created, location: @precipitation_measurement }
      else
        format.html { render :new }
        format.json { render json: @precipitation_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /precipitation_measurements/1
  # PATCH/PUT /precipitation_measurements/1.json
  def update
    respond_to do |format|
      if @precipitation_measurement.update(precipitation_measurement_params)
        format.html { redirect_to @precipitation_measurement, notice: 'Precipitation measurement was successfully updated.' }
        format.json { render :show, status: :ok, location: @precipitation_measurement }
      else
        format.html { render :edit }
        format.json { render json: @precipitation_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /precipitation_measurements/1
  # DELETE /precipitation_measurements/1.json
  def destroy
    @precipitation_measurement.destroy
    respond_to do |format|
      format.html { redirect_to precipitation_measurements_url, notice: 'Precipitation measurement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_precipitation_measurement
      @precipitation_measurement = PrecipitationMeasurement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def precipitation_measurement_params
      params.require(:precipitation_measurement).permit(:STATION, :ELEVATION, :LATITUDE, :LONGITUDE, :DATE, :YTD_PRECIP_NORM, :YTD2013_PRECIP, :PRECIP2013_DIFF, :YTD2014_PRECIP, :PRECIP2014_DIFF, :YTD2015_PRECIP, :PRECIP2015_DIFF)
    end
end
