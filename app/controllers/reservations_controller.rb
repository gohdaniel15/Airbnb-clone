class ReservationsController < ApplicationController
before_action :find_reservation, only: [:show, :edit, :update, :destroy]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.listing_id = params[:listing_id]
    @listing = @reservation.listing
    if (@reservation.reserved_dates & @listing.blocked_dates).empty? && @reservation.save
      UserMailer.sample_email(@listing.user).deliver
      redirect_to listing_path(@listing)
    else
      redirect_to new_listing_reservation_path
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end
end
