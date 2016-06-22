class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body
      t.integer :user_id
      t.integer :post_id
      t.boolean :best_answer, default: false

      t.timestamps null: false
    end
  end
end
