class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, default: 1
      t.references :votable, polymorphic: true, index: true
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
