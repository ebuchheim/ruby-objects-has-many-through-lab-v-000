class Genre
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
        songs = []
        Song.all.select do |song|
            if song.genre == self && !songs.include?(song)
                songs << song
            end
        end
        songs
    end

    def artists
        artists = []
        Song.all.select do |song|
            if song.genre == self && !artists.include?(song.artist)
                artists << song.artist
            end
        end
        artists
    end

    def self.all
        @@all
    end

end