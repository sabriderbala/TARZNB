class PagesController < ApplicationController
  def home
  end

  def dashboard
    @cabans_as_p = Caban.where(user: current_user)
    @bookings_as_r = Booking.where(user: current_user)
    @bookings_as_p = Booking.where(caban: @cabans_as_p)
  end
end
