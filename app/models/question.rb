class Question < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :answers
  belongs_to :author, class_name: User, foreign_key: :user_id

  validates :title, :content, presence: true
end
