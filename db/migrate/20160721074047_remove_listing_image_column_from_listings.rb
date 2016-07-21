class RemoveListingImageColumnFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :listing_image
  end
end
