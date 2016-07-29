class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update]

  def new
    @listing = Listing.new
  end

  def create
    @user = current_user
    @listing = @user.listings.new(listing_params)
    @taglist = []
    @taglist = params[:listings][:tags][:name].downcase
    @taglist = @taglist.split(",")
    @taglist = @taglist.each {|x| x.gsub!(" ","")}

    @taglist.each do |tag|
      @listing.tags << Tag.find_or_create_by(name: "#{tag}")
    end

    if @listing.save
      redirect_to @listing
    else
      redirect_to root_url
    end
  end

  def index
    @listing = Listing.all
  end

  def show
    @reservation = current_user.reservations.find_by(listing_id: @listing.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @search = Listing.search params[:search],
    fields: [
      {country: :word_start},
      {name: :word_start},
      {address: :word_start},
      {city: :word_start},
      {no_of_guests: :word_start}],
    where: {
      no_of_guests: params[:no_of_guests],
      },
    page: params[:page], per_page: 5
    @searched_date_range = to_date_range(params[:start_date].to_date, params[:end_date].to_date)
    @search.each do |search|
            if !(search.blocked_dates & @searched_date_range).empty?
                @search.results.delete(search)
            end
        end
  end

  private

  def listing_params
    params.require(:listings).permit(:name, :address, :city, :country, :property_type, :no_of_guests, :no_of_beds, :no_of_bathrooms, :description, :price, :user_id, {listing_images: []})
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def to_date_range(start_date, end_date)
    dates = (start_date..end_date).to_a
    return dates
  end
end
