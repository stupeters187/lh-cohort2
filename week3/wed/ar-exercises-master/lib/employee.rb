class Employee < ActiveRecord::Base

  belongs_to :store

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: {only_integer: true, greater_than: 40, less_than: 2000}
  validates_associated :store

end
