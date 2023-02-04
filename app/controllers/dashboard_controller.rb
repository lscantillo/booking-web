class DashboardController < ApplicationController
  def index
    start_date = Date.today.beginning_of_month
    @bookings = Booking.where(start_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end
end
