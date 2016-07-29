class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :listing_tags
  has_many :tags, through: :listing_tags
  has_many :reservations, dependent: :destroy

  mount_uploaders :listing_images, ListingImagesUploader

  searchkick word_start: [:name, :country, :city, :type, :address, :property_type, :description]

  def blocked_dates
    dates = []
    self.reservations.each do |r|
      r.reserved_dates.each do |d|
        dates << d
      end
    end
    return dates
  end

  def booked_dates
    reservations.map do |r|
      r.each_date.map do |d|
        x = r.dup
        x.book_date = d
        x
      end
    end.flatten
  end



end
