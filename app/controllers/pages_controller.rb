class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]
  def home
  end

  def dashboard
    @cabans_as_p = Caban.where(user: current_user)
    @bookings_as_p = Booking.where(caban: @cabans_as_p)
    @bookings_as_r = Booking.where(user: current_user)
    if params[:status]
      @bookings_as_p = @bookings_as_p.search_by_status(params[:status])
    else
      @bookings_as_p
    end
  end
end
