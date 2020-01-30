class Artist 

    attr_accessor :name 

    @@all = [] 

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
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
        if @@all.find {|artist| artist.name == name}
            @@all.each {|artist| return artist if artist.name == name}
        else 
            self.new(name)
        end
    end 

    def print_songs
        self.songs.each do |song|
            puts song.name 
        end
    end

end