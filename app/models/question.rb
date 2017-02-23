class Question < ActiveRecord::Base
  # Remember to create a migration!
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates :title, :content, presence: true
end
