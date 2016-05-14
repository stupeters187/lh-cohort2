class Employee < ActiveRecord::Base
  
  belongs_to :store

  validates :first_name, :last_name, presence: true

  after_create :increment_employee_count
  after_destroy :decrement_employee_count

  def increment_employee_count
    if gender == 'M'
      store.male_employees += 1
    elsif gender == 'F'
      store.female_employees += 1
    end
    store.save
  end

  def decrement_employee_count
    if gender == 'M'
      store.male_employees -= 1
    elsif gender == 'F'
      store.female_employees -= 1
    end
    store.save
  end  
        
  def annual_salary
    hourly_rate * 1950
  end

  def self.average_hourly_rate_for(gender)
    if gender == 'M'
      Employee.where(gender: 'M').average(:hourly_rate).to_f.round(2)
    elsif gender == 'F'
      Employee.where(gender: 'F').average(:hourly_rate).to_f.round(2)
    else
      Employee.all.average(:hourly_rate).to_f.round(2)
    end
  end

end
