class Artist

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def new_song(song_name, song_genre)
        song = Song.new(song_name, self, song_genre)
        @songs << song
        song
    end

    def songs
        @songs
    end

    def genres
        my_genres = []
        Song.all.select do |song|
            if song.artist == self && !my_genres.include?(song.genre)
                my_genres << song.genre
            end
        end
        my_genres
    end

end