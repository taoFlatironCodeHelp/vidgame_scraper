class VidgameScraper::Category

    attr_accessor :name, :url

    @@all = []

    def initialize(name, url)
        @name = name
        @url = "https://austin.craigslist.org" + url

        @@all << self   #saving the obj.

        def self.all
            @@all
        end

    end

end 