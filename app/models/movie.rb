class Movie < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates :title, presence: true
  validates :rating, presence: true
  validates :release_date, presence: { message: "looks bad" }
  validates :description, presence: true,
                          length: { minimum: 10 }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  scope :list_for, ->(user, options) {
    res = all
    res = res.where(rating: options[:rating]) if options.key? :rating
    res = res.order(options[:order]) if options.key? :order
    res = res.where('published = :d OR user_id = :u', d: true, u: user.id) if !user.admin?
    res
  }

  before_validation :generate_twin_id, on: :create
 
  def self.all_ratings
    #Movie.select(:rating).distinct.pluck(:rating)
    all.map(&:rating).uniq
  end

  def generate_twin_id
    self.twin_id = SecureRandom.uuid
  end

end
