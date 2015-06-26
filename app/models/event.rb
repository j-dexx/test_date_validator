class Event < ActiveRecord::Base
  validates_with DateValidator, start_date: :start_date, end_date: :end_date
  validates :start_date, :end_date, presence: true
end
