require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist

def initialize(name)
  @name = name
end



def artist=(artist)
  @artist = artist
  artist.songs << self
end

def self.new_by_filename(file_name)
  song_file = file_name.split(" - ")
    new_song = Song.new(song_file[1])
    new_song.artist = Artist.new(song_file[0])
    new_song.artist.save
    new_song
end

end