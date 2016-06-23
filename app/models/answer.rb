class Answer < ActiveRecord::Base
  include Countable
  has_many    :comments, as: :commentable
  has_many    :votes, as: :votable
  belongs_to  :responder, { class_name: 'User', foreign_key: 'user_id' }
  belongs_to  :post
  has_one     :poster, { through: :post, source: :poster }

  validates   :responder, uniqueness: { scope: :post }
  validates   :body, presence: true
  # validates   :best_answer
end
