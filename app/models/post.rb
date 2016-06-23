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

  def age
    post_create = self.created_at
    date = DateTime.now
    day_age = date - post_create.to_date
    age = date.to_time - post_create
    post_time = Time.at(age).utc.strftime("%H:%M:%S")

    if time_age == "24:00:00"
      "#{day_age} days ago"
    elsif
      "#{post_time} hours ago"
    elsif time_age[0] && time_age[1] == "0"
      "#{post_time} minutes ago"
    elsif time_age[2] && time_age[3] == "0"
      "#{post_time} seconds ago"
    end

  end
end


