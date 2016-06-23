module Countable

  def points
    self.votes.reduce(0) { |sum, vote| sum + vote.value }
  end

end
