class Question < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates_length_of :title, :minimum => 5, :allow_blank => false
  validates_length_of :body, :minimum => 5, :allow_blank => false
end
