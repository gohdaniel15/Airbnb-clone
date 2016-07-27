class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user
  has_many :payments

  attr_accessor :book_date

  def reserved_dates
    (self.start_date..self.end_date).to_a
  end

  def each_date
    (self.start_date..self.end_date)
  end

  def start_time
      self.book_date
  end

end
