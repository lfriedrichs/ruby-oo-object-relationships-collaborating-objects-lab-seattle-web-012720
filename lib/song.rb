class Song 

    attr_accessor :name, :artist 

    @@all = [] 

    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

    def self.new_by_filename(filename)
        artist, title = filename.split(" - ")
        song = self.new(title)
        song.artist_name=(artist)
        song
    end
end