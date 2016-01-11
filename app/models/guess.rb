class Guess < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment

  scope :correct_guesses, ->(user_id) { where 'user_id = ? and correct = ?', user_id, true }
end
