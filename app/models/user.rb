class User < ActiveRecord::Base
  has_many    :posts
  has_many    :answers
  has_many    :comments
  has_many    :votes

  validates   :display_name, presence:true, length: { limit: 50 }, uniqueness: true
  validates   :email, presence:true, uniqueness: true
  validates   :password, presence:true, length: { minimum: 8 }
end
