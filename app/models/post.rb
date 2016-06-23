class Post < ActiveRecord::Base
  has_many                 :comments, as: :commentable
  has_many                 :answers
  has_many                 :votes, as: :votable
  belongs_to               :poster, { class_name: 'User', foreign_key: 'user_id' }
  has_and_belongs_to_many  :tags

  validates :body, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :tags, presence: true

  def points
    self.votes.reduce(0) { |sum, vote| sum + vote.value }
  end
end
