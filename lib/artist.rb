class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def self.all
    @@all
  end


  def self.find_or_create_by_name(name)
      unless @@all.detect {|song| song.name == name}
        self.new(name)
      end
  end

  def print_songs
    @songs.each do |song|
    puts song.name
  end
end




end