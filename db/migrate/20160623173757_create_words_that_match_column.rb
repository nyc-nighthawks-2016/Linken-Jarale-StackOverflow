class CreateWordsThatMatchColumn < ActiveRecord::Migration
  def change
    add_column :posts, :words_that_match, :integer, :default => 0
  end

end
