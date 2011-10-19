class Song
    def initialize(name, artist, duration)
        @name = name
        @artist = artist
        @duration = duration
    end

    def to_s
        "Song: #{@name} by: #{@artist} (#{@duration})"
    end
end

class KaraokeSong < Song
    def initialize(name, artist, duration, lyrics)
        super(name, artist, duration)
        @lyrics = lyrics
    end

    def to_s
        super + " [#{@lyrics}]"
    end

end

obj = KaraokeSong.new('Bicylops', 'Fooba', 1.5, 'And now the ... ')
print obj

