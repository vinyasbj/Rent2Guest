class BookingsController < ApplicationController
	before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @bookings = Booking.all
  end

  def show
  end

  
  def new
    @booking = Booking.new
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    respond_to do |format|
      if @booking.save
        format.html { redirect_to room_path(@booking.room_id), notice: 'booking was successfull.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def my_bookings
    authorize! :my_bookings,Booking.new
    @bookings = Booking.current_user.all
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:start_date,:end_date,:user_id,:amount,:room_id,:is_confirmed)
    end
end
