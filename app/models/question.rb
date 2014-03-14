class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :answers
  has_many :votes, as: :voteable
  has_one :visit, as: :visitable

  validates :user_id, presence: true
  validates_length_of :title, :minimum => 5
  validates_length_of :body, :minimum => 5

  # scope :popular,
  #   select("questions.title, count(visits.unique_visits) as visits_count").
  #   joins(:visits).
  #   group("questions.title").
  #   order("visits_count DESC").
end
