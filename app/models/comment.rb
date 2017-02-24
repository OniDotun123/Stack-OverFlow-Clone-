class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: User, foreign_key: :user_id
  has_many :votes, as: :votable
  has_many :downvotes, as: :downvotable

  def vote_count
    total = self.votes.count - self.downvotes.count
  end
end
