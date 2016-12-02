require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    new_song = self.new
    new_song.save
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new.save
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == name
      song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
  end
  end

  def self.new_from_filename(filename)
    formatted = filename.split(' - ')
     artist = formatted[0]
      formatted_song = formatted[1].gsub(".mp3", "")
      song = self.create_by_name(formatted_song)
# binding.pry
      song.artist_name = artist
      song
 end

 def self.create_from_filename(filename)
  self.new_from_filename(filename).save
end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
    self
  end

end
