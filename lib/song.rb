class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song 
  end

  def self.new_by_name(name)
    song = Song.new 
    song.name = name 
    song 
  end

  def self.create_by_name(name)
    song = Song.new 
    song.name = name 
    song.save 
    song 
  end

  def self.find_by_name(name)
    self.all.find {|s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    artist_name = file.split(" - ")[0]
    song_name = file.split(" - ")[1].gsub(".mp3","")

    song = Song.new_by_name(song_name)
    song.artist_name = artist_name 
    song 
  end

  def self.create_from_filename(file)
    artist_name = file.split(" - ")[0]
    song_name = file.split(" - ")[1].gsub(".mp3","")

    song = Song.new_by_name(song_name)
    song.artist_name = artist_name 
    song.save 
    song 
  end

  def self.destroy_all 
    self.all.clear 
  end
end
