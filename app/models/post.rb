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
    post_time = Time.at(age).utc.strftime("%H%M%S")
    time_string = ''
    if post_time == "24:00:00"
      time_string = "#{day_age} days ago"
    elsif
      time_string = "#{post_time[0..1].gsub(/^0/,'')} hours ago"
    elsif post_time[0] && post_time[1] == "0"
      time_string = "#{post_time[2..3].gsub(/^0/,'')} minutes ago"
    elsif post_time[2] && post_time[3] == "0"
      time_string = "#{post_time[4..5].gsub(/^0/,'')} seconds ago"
    end
    time_string
  end
end


