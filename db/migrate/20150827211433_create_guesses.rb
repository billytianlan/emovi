class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :body
      t.boolean :correct
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
