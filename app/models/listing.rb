class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :listing_tags
  has_many :tags, through: :listing_tags
  has_many :reservations, dependent: :destroy

  mount_uploaders :listing_images, ListingImagesUploader

  def blocked_dates
    dates = []
    self.reservations.each do |r|
      r.reserved_dates.each do |d|
        dates << d
      end
    end
    return dates
  end

end
