class VidgameScraper::Scraper

    def self.scrape_categories(url)
        #open the url and scrape all the catagories
        
        webpage = Nokogiri::HTML(open(url))
        section = webpage.css(".rows").css(".result-row").css(".result-info").css(".result-heading")
        # section = webpage.css("div.product-tile").css("div.product-tile-header").css("a.link-name") #Gamestop test
        # binding.pry   
        array_of_links = section.css("h3 a.hdrlnk")
        # array_of_links = section.css("p.pd-name")   #Gamestop test
        
        array_of_links.map do |link|
            # binding.pry
            VidgameScraper::Category.new(link.text, link.attributes["href"].value)
        end
        #will return a list of the items for sale?? 
    end

    def self.scrape_items(category)
        webpage = Nokogiri::HTML(open(category.url))
        # items = webpage.css("")
        binding.pry
    end



end

    #link.attributes["href"].valu shows the URL


    #URL Gamestop => section.css("a.product-tile-link")[0].attributes["href"].value
    #section = webpage.css("div.product-tile").css("div.product-tile-link-block")