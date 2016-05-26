class Movie < ActiveRecord::Base

  has_many :reviews
  mount_uploader :image, ImageUploader 


  validates :title,
  presence: true

  validates :director,
  presence: true

  validates :runtime_in_minutes,
  numericality: { only_integer: true }

  validates :description,
  presence: true


  validates :release_date,
  presence: true
  
  validate :release_date_is_in_the_past


  def review_average
    reviews.average(:rating_out_of_ten) if reviews
  end

  def image_src
    image || poster_image_url
  end
  
  def self.search(search)
      where('title LIKE :search OR director LIKE :search', {search: "%#{search}%"} )
  end

  def self.search_duration(duration)
    if duration == "Under 90 minutes"
      where('runtime_in_minutes < 90')
    elsif duration == "90 - 120 minutes"
      where('runtime_in_minutes >= 90 AND runtime_in_minutes <= 120')
    elsif duration == "Over 120 minutes"
      where('runtime_in_minutes > 120')
    else
      where(nil)
    end  
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end
  
end
