class VidgameScraper::Scraper

    def self.scrape_categories(url)
        #open the url and scrape all the catagories
        
        webpage = Nokogiri::HTML(open(url))
        section = webpage.css(".rows").css(".result-row").css(".result-info").css(".result-heading")
        # binding.pry   
        array_of_links = section.css("h3 a.hdrlnk")
        
        array_of_links.map do |link|
            VidgameScraper::Category.new(link.text, link.attributes["href"].value)
        end
       #will return a list of the items for sale?? 
    end



       
end

    #link.attributes["href"].valu shows the URL