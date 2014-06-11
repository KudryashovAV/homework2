class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :rating, presence: true
  validates :release_date, presence: { message: "looks bad" }
  #validates :description, presence: true,
                          #length: { minimum: 10 }

  scope :list, ->(options) {
    res = all
    res = res.where(rating: options[:rating]) if options.key? :rating
    res = res.order(options[:order]) if options.key? :order
    res
  }
 
  def self.all_ratings
    #Movie.select(:rating).distinct.pluck(:rating)
    all.map(&:rating).uniq
  end

end
