class Artist


    @@all = []
    attr_accessor :name 
    def initialize(name)
        @name = name
        
        @@all << self
    end

   def self.all
    @@all
   end

   def add_song(song)
    song.artist = self
   end

   def songs
   Song.all.select do |song|
   song.artist == self
   end
   end
   
   def self.find_or_create_by_name(name)
    foundya = @@all.find { |artist| artist.name == name}
   
    if (foundya)
        return foundya
    else  
        return self.new(name)
    end 
   end
   
   def print_songs
  
    songs.each { |song| puts song.name }
   end 
   


end