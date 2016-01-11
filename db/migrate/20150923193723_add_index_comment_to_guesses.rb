class AddIndexCommentToGuesses < ActiveRecord::Migration
  def change
    add_index :guesses, :comment_id
  end
end
