class AddDefaultValueToGuesses < ActiveRecord::Migration
  def change
    change_column :guesses, :correct, :boolean, :default => false
  end
end
