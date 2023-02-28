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

  def accept
    @booking = Booking.find_by_id(params[:id])
    @booking.update(status: "accepted")
    redirect_to dashboard_path
  end

  def refuse
    @booking = Booking.find_by_id(params[:id])
    @booking.update(status: "declined")
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
