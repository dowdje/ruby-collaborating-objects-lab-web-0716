require 'pry'
class MP3Importer
  attr_reader :path




def initialize(file_path)
  @path = file_path
  @files = []
end

def files
files_raw = File.join(@path, "*.mp3")
@files = Dir.glob(files_raw)
@files.collect {|file| file.slice! @path + "/"}
@files
end

def import
  self.files.each do |file|
    song_file = file.split(" - ")
    new_song = Song.new(song_file[1])
    
    unless Artist.all.any? {|person| person.name == song_file[0]}
    new_song.artist = Artist.new(song_file[0])
    new_song.artist.save
  end
  end

end


end