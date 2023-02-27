class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @caban = Caban.find(params[:caban_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @caban = Caban.find(params[:caban_id])
    @booking.caban = @caban
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end