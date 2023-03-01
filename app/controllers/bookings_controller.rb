class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    authorize @booking
    @caban = Caban.find(params[:caban_id])
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
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
    authorize @booking
    redirect_to dashboard_path
  end

  def refuse
    @booking = Booking.find_by_id(params[:id])
    @booking.update(status: "declined")
    authorize @booking
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find_by_id(params[:id])
    if @booking.status == "pending"
      @booking.destroy
      authorize @booking
      redirect_to dashboard_path
    else
      redirect_to dashboard_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
