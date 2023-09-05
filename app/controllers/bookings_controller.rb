class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def create
    car_id = params[:car_id]
    start_date, end_date = params[:booking][:date_range].split(" to ").map { |d| Date.parse(d) }
    @booking = Booking.create(user_id: current_user.id, car_id: car_id, starts_at: start_date, ends_at: end_date, accepted: false)
    if @booking.save
      flash[:success] = "Successfully booked #{Car.find(car_id).brand}!"
    else
      flash[:notice] = "Cant seem to book this car try again!"
    end
    redirect_to car_path(@booking.car)
  end

  def booking_params
    params.require(:booking).permit(:Start, :End, :car_id)
  end
end
