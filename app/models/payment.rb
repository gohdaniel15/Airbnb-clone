class Payment < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :user
end
