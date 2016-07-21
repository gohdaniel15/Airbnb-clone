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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def listing_params
    params.require(:listings).permit(:name, :address, :city, :country, :property_type, :no_of_guests, :no_of_beds, :no_of_bathrooms, :description, :price, :user_id, {listing_images: []})
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
