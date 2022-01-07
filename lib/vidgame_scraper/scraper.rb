class VidgameScraper::Scraper

    def self.scrape_all_items(url)
        #open the url and scrape all the items ps4,ps5 etc.ur
        # url =" https://austin.craigslist.org/#{type}"
        webpage = Nokogiri::HTML(open(url))
        section = webpage.css(".rows").css(".result-row").css(".result-info").css(".result-heading")
        array_of_links = section.css("h3 a.hdrlnk")

        array_of_links.map do |link|
            VidgameScraper::Category.new(link.text, link.attributes["href"].value)
        end
            # binding.pry
        #will return a list of the items for sale?? 
    end

    def self.scrape_items(category)         
        webpage = Nokogiri::HTML(open(category.url))
        items = webpage.css(".body")
        items.each do |card|
            # binding.pry

            deal = VidgameScraper::Deal.new

            
            title = card.css(".postingtitletext").text.strip #shows the title of the item.
            condition = card.css("p.attrgroup").text.gsub("  ","").gsub("\n", "")
            price = card.css(".price").text


            name_and_price = card.css(".postingtitletext").text.strip.split("-")

            description = card.css("#postingbody").inner_text.gsub("  ", "").gsub("QR Code Link to This Post", "").gsub("\n", "").gsub("-", " -") #shwos desc.
            # notices = card.css("ul.notices").css("li").text # shows the bullet point desc.
            deal.product = name_and_price[0]
            deal.price = name_and_price[1]

            category.add_deal(deal)
            #  binding.pry
        end
    end
end

    #link.attributes["href"].valu shows the URL



    #**  will show the price of the item being sold **
    # [25] pry(VidgameScraper::Scraper)> webpage.css(".body").css("h1.postingtitle").css(".price").text
    # => "$1"

    #** for any listed things on the page**
    # [37] pry(VidgameScraper::Scraper)> webpage.css("ul.notices").css("li").text
    # => "do NOT contact me with unsolicited services or offers"