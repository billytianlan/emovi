class Movie < ActiveRecord::Base
  acts_as_commentable
  scope :filter_by, -> (year, rating_count) { where "year >= ? AND movie_lens_total_rating_count >= ?", year, rating_count }
end
