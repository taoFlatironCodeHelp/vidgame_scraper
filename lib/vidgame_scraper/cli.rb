class VidgameScraper::CLI

    def start   #instance method
        puts "\n         Welcome to my".colorize(:white) +  " CLI!".colorize(:blue)
        puts "What category do you want deals on today?".colorize(:white)
        puts " \nVideo Games,".colorize(:white) + " Cell Phones,".colorize(:white) + " Furniture".colorize(:white) + " or" + " Exit".colorize(:red)
        puts "\nType either" + " 'Video Games',".colorize(:white) + "'Cell Phones',".colorize(:white) + "'Furniture'".colorize(:white) + " or" +  " 'Exit'.".colorize(:red)

        input = gets.strip.downcase
        case input
        when "video games"
            puts "in" + " Video Games".colorize(:green)
            #scrape the video games page
            url = "https://craigslist.org/"
            categoires = VidgameScraper::ScraperR.scrap_catagories(url)
            puts "Link: #{categoires[19].name}"
            puts "URL: #{categoires[19].url}"
            # puts categories[0].name
            # puts categories[0].url

        when "cell phones"
            puts "In" + " Cell Phone".colorize(:green)
            # url = "https://craigslist.org/"
            # binding.pry
            VidgameScraper::ScraperL.scrap_catagories(url)
            # puts "Link: #{categoires[2].name}"
            # puts "Link: #{categoires[2].url}"


        when "furniture"
            puts "In" + " Furniture".colorize(:green)


        when "exit"
            puts "Goodbye!".colorize(:red)
        else
            puts "Sorry invalid answer".colorize(:red)
            #they input something incorrect
        end

    end


end