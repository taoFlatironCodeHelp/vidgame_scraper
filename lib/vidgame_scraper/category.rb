class VidgameScraper::Category

    attr_accessor :name, :url

    @@all = []

    def initialize(name, url)
        @name = name
        @url = "https://austin.craigslist.org/d/video-gaming/search/vga" + url

        @@all << self   #saving the obj.

    end

    def self.all
        @@all
    end

end 