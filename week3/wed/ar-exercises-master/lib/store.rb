require_relative '../setup'


class Store < ActiveRecord::Base

  has_many :employees

  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validate :must_carry_one_kind_of_apparel


  def must_carry_one_kind_of_apparel
    if (womens_apparel == false && mens_apparel == false)
      errors.add(:base, "must carry one kind of apparel")
    end
  end
end
