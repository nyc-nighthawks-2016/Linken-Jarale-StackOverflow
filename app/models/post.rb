class Post < ActiveRecord::Base
  has_many                 :comments, as: :commentable
  has_many                 :answers
  has_many                 :votes, as: :votable
  belongs_to               :poster, class_name: 'User'
  has_and_belongs_to_many  :tags

  validates :body, presence: true
  validates :title, presence: true, length: { limit: 50 }
end
