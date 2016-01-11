require 'csv'

 namespace :populate_movie_data do

  desc 'Add Movies from Movie Lens'
  task movie_lens_movies: :environment do
    movies = []

    file = File.open("lib/movies.csv", "r:ISO-8859-1")
    csv_text = file
    csv = CSV.parse(csv_text, :headers => true)
    puts 'Adding Movie Lens Dataset'
    csv.each do |record|
      if record['movieId'].present? && record['title'].present?
        movie = Movie.new( title: record['title'], movie_lens_id: record['movieId'] )
        if movie.save
          movies << movie
        end
      end
    end
    puts "Added #{movies.size} movies"
  end

  desc 'Add IMDB and TMDB ID'
  task add_imdb_tmdb_id_movie_lens_data: :environment do
    movies = []

    file = File.open("lib/links.csv", "r:ISO-8859-1")
    csv_text = file
    csv = CSV.parse(csv_text, :headers => true)
    puts 'Adding IMDB and TMDB ID from Movie Lens Dataset'
    csv.each do |record|
      if record['movieId'].present? && record['imdbId'].present? && record['tmdbId'].present?
        movie = Movie.find_by( movie_lens_id: record['movieId'] )
        movie.update( imdb_id: record['imdbId'], tmdb_id: record['tmdbId'])

        if movie.save
          puts "updated #{movie.title}"
          movies << movie
        end
      end
    end

    puts "Added #{movies.size} movies"
  end

  desc 'Add Ratings'
  task add_movie_lens_ratings: :environment do
    movies = []

    file = File.open("lib/ratings.csv", "r:ISO-8859-1")
    csv_text = file
    csv = CSV.parse(csv_text, :headers => true)
    puts 'Adding ratings from Movie Lens Dataset'
    csv.each do |record|
      if record['movieId'].present? && record['rating'].present?
        movie = Movie.find_by( movie_lens_id: record['movieId'] )

        if movie.movie_lens_total_rating_count == nil
          movie.update(movie_lens_total_rating_count: 1)
        else
          updated_count = movie.movie_lens_total_rating_count + 1
          movie.update(movie_lens_total_rating_count: updated_count)
        end

        if movie.movie_lens_rating == nil
          movie.update(movie_lens_rating: record['rating'])
        else
          updated_count = movie.movie_lens_rating + record['rating'].to_i
          movie.update(movie_lens_rating: updated_count)
        end

        puts "updated #{movie.title}"
        movies << movie

      end
    end
  end

  desc 'Add Year'
  task add_year_to_movies: :environment do
    movies = []
    file = File.open("lib/movies.csv", "r:ISO-8859-1")
    csv_text = file
    csv = CSV.parse(csv_text, :headers => true)
    puts 'Adding Year to Movies'
    csv.each do |record|
      if record['movieId'].present? && record['title'].present?
        movie = Movie.find_by( movie_lens_id: record['movieId'] )

        year = record['title'].split("(").last.split(")").first.to_i
        movie.update(year: year)

        if movie.save
          movies << movie
          puts "updated #{movie.title}"
        end
      end
    end
    puts "Added year to #{movies.size} movies"
  end

  desc 'fix title'
  task fix_title_for_movie: :environment do
    binding.pry
    Movie.all.each do |movie|
      if movie.title.include? ()
  end

end
