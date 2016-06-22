class Song
  attr_accessor :artist, :name
  def initialize(name)
    @name = name
  end

  def artist=(artist_name)
    @artist = artist_name
  end

  def self.new_by_filename(file)
    #parse song file
    song_array = file.split("-")
    #get name
    song_name = song_array.last.chomp(".mp3")
    song_name[0] = ''
    #get artist 
    artist_name = song_array.first.chomp(" ")
    #make a new song 
    song = self.new(song_name)
    #update or create artist 
    artist = Artist.find_or_create_by_name(artist_name)
    artist.songs << song
    song
  end 

end