class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    Song.select{|song| song.genre == self}.count
  end

  def artist_count
    Song.select{|song| song.genre == self}.map{|song| song.artist}.uniq.count
  end

  def all_artist_names
    Song.select{|song| song.genre == self}.map{|song| song.artist.name}.uniq
  end
end
