class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :description, presence: true
end
