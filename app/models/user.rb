class User < ActiveRecord::Base
  # Remember to create a migration!
    has_many :comments, as: :commentable
    has_many :questions
    has_many :answers

    validates :username, :email, uniqueness: true
    validates :username, :email, presence: true

    has_secure_password
end
