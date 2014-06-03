class Movie < ActiveRecord::Base
  validates :title, :rating, :release_date, presence: true
  validates :title, uniqueness: { scope: :release_date, message: "The film with the same name and release date, there is restriction" }
  validates :rating,  format: {with: /\A(G|PG|PG-13|R|NC-17)\z/, message: "Rating must be G, PG, PG-13, R or NC-17"}
  #validates :release_date, format: {with: /\A(\d{4}-\d{2}-\d{2})\z/, message: "Release date format must be yyyy-mm-dd"}
  def validate_release_date
  Date.parse(self.release_date)
  rescue ArgumentError
  errors.add(:release_date, "This is not the date you are looking for")
end
end
