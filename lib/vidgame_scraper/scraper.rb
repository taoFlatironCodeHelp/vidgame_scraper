class VidgameScraper::Scraper

    def self.scrap_categories(url)
        #open the url and scrape all the catagories
        
        webpage = Nokogiri::HTML(open(url))
        section = webpage.css("#sss1") #the right column fromt the "for sale section"
        array_of_links = section.css("li") # => an array of links.

                #array of the right side of the form from "for sale"
        array_of_links.map do |link|
            # binding.pry
            VidgameScraper::Category.new(link.text, link.elements[0].attributes["href"].value)
        end

        # binding.pry
    end

end

# link.elements[0].attributes["href"].value => gets me the linkf or "Furniture"


#~~ Right column

## section = webpage.css("#sss1") for the right side!!
## main page # section.css("li")[19].text => "Video game"
## main page # section.css("li")[2].text => "furniture"