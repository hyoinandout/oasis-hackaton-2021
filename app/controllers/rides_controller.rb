class RidesController < ApplicationController
  before_action :set_ride, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /rides or /rides.json
  def index
    @rides = Ride.all

    if params[:departure].present?
      @rides = @rides.where(departure: params[:departure])
    end
  
    if params[:arrival].present?
      @rides = @rides.where(arrival: params[:arrival])
    end
  
    if params[:min].present?
      @rides = @rides.where(min: params[:min])
    end
  end

  # GET /rides/1 or /rides/1.json
  def show
  end

  # GET /rides/new
  def new
    @ride = Ride.new
  end

  # GET /rides/1/edit
  def edit
  end

  # POST /rides or /rides.json
  def create
    @ride = Ride.new(ride_params)
    @ride.user = current_user
    respond_to do |format|
      if @ride.save
        format.html { redirect_to @ride, notice: "Ride was successfully created." }
        format.json { render :show, status: :created, location: @ride }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rides/1 or /rides/1.json
  def update
    respond_to do |format|
      if @ride.update(ride_params)
        format.html { redirect_to @ride, notice: "Ride was successfully updated." }
        format.json { render :show, status: :ok, location: @ride }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rides/1 or /rides/1.json
  def destroy
    @ride.destroy
    respond_to do |format|
      format.html { redirect_to rides_url, notice: "Ride was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ride
      @ride = Ride.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ride_params
      params.require(:ride).permit(:departure, :arrival, :reservation, :min, :max, :memo, :via, :samesex)
    end
end
