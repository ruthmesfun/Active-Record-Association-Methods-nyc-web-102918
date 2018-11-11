class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    Song.all.first.genre
  end

  def song_count

    Song.select{|song| song.artist == self}.count
  end

  def genre_count
    Song.select{|song| song.artist == self}.map{|song| song.genre}.uniq.count
  end
end
