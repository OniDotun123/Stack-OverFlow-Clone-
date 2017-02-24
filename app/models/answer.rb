class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :author, class_name: User, foreign_key: :user_id


  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates :content, presence: true
end
