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
    elsif post_time[2] && post_time[3] == "0"
      time_string = "#{post_time[4..5].gsub(/^0/,'')} seconds ago"
    elsif post_time[0] && post_time[1] == "0"
      time_string = "#{post_time[2..3].gsub(/^0/,'')} minutes ago"
    else
      time_string = "#{post_time[0..1].gsub(/^0/,'')} hours ago"
    end
    time_string
  end

  def self.search(string)
    @posts_to_search = Post.all
    @posts_to_search.each do |post|
      @words_in_body = post.body.split
      post.words_that_match = 0
      post.save
      @same_words =[]
      string.each do |searched_word|
        @words_in_body.each do |word_in_body|
          if word_in_body.upcase == searched_word.upcase
            @same_words << word_in_body
          end
        end
      end
    post.words_that_match = @same_words.count
    post.save
    end
    @same_words
  end

end


