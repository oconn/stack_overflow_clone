class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :answers
  has_many :votes, as: :voteable
  has_one :visit, as: :visitable

  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
  validates_length_of :title, :minimum => 5, :allow_blank => false
  validates_length_of :body, :minimum => 5, :allow_blank => false

  # scope :popular,
  #   select("questions.title, count(visits.unique_visits) as visits_count").
  #   joins(:visits).
  #   group("questions.title").
  #   order("visits_count DESC").

end
