class Comment < ActiveRecord::Base
  belongs_to  :commentable, polymorphic: true
  belongs_to  :commenter, { class_name: 'User', foreign_key: 'user_id' }

  validates :content, presence: true
end
