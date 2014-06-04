class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :rating, presence: true
  validates :release_date, presence: { message: "looks bad" }
  validates :description, presence: true,
                          length: { minimum: 10 }


  def self.all_ratings
    Movie.select(:rating).distinct.pluck(:rating)
  end

end