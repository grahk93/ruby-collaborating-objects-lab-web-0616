require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    save
  end
 

  def save #save artist instance to all 
    @@all << self
  end

  def self.all #return all artists 
    @@all.uniq
  end

  def add_song(song_obj) #add song to artist instance, add artist to song
    self.songs << song_obj
    song_obj.artist = self
  end

  def self.create #create a new artist instance
    self.new(name).tap {|artist| artist.save}
  end

  def self.find_by_name(name) #finds an artist instance by name 
    self.all.find do |artist|
      artist.name == name
    end
  end


  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      artist = self.create
    else
     artist = self.find_by_name(name)
    end

    artist
  end

  def print_songs #prints all of an artists songs
      self.songs.each do |song|
        puts song.name
      end
  end

end
 