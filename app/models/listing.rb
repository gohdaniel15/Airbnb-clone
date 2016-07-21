class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :listing_tags
  has_many :tags, through: :listing_tags

  def tag_list
    tags.join(", ")
  end

end
