class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :voter, { class_name: 'User', foreign_key: 'user_id' }

  validates :value, presence: true
  validates :user_id, uniqueness: { scope: [:votable_id, :votable_type] }
end
