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


        #array of the right side of the form from "for sale"
        # array_of_links.map do |link|
        #     # binding.pry
        #     VidgameScraper::Category.new(link.text, link.elements[0].attributes["href"].value)
        # end

    # def self.scrape_items(category)
    # webpage = Nokogiri::HTML(open(category.url))
    # binding.pry
    # # items = webpage.css("")
    # end

        # ~~~~~~~~~~~~~~~~
        # webpage = Nokogiri::HTML(open(url))
        # section = webpage.css("rows") #the right column fromt the "for sale section"
        # array_of_links = section.css(".results-row")

        # array_of_links.map do |link|
        #     VidgameScraper::Category.new(link.firts.inner_text, link.first.attributes["href"].value)
        # end

        

        # binding.pry

# link.elements[0].attributes["href"].value => gets me the linkf or "Furniture"


#~~ Right column

## section = webpage.css("#sss1") for the right side!!
## main page # section.css("li")[19].text => "Video game"
## main page # section.css("li")[2].text => "furniture"