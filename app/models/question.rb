class Question < ActiveRecord::Base
  has_many :answers
  has_many :votes, as: :votable
  has_many :downvotes, as: :downvotable
  has_many :comments, as: :commentable
  belongs_to :author, class_name: User, foreign_key: :user_id

  validates :title, :content, presence: true

  def vote_count
    total = self.votes.count - self.downvotes.count
  end
end
