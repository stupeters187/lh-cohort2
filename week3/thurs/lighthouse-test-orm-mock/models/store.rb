class Store < ActiveRecord::Base

  has_many :employees

  validates :name, presence: true, length: { maximum: 25}
  validates :annual_revenue, numericality: {integer_only: true, greater_than_or_equal_to: 0}
  validates :male_employees, :female_employees, numericality: {integer_only: true, greater_than_or_equal_to: 0}

  def annual_expense
    employees.inject(0){ |sum_expense, employee|
      sum_expense += employee.annual_salary
    }
  end

  def annual_profit
    annual_revenue - annual_expense
  end

end
