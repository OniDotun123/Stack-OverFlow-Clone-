class Downvote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :votable, polymorphic: true
  validates :user_id, uniqueness: true
end
