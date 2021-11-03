class VidgameScraper::CLI

    def start   #instance method
        puts "\n         Welcome to my".colorize(:white) +  " CLI!".colorize(:blue)
        puts "What category do you want deals on today?".colorize(:white)
        puts " \nVideo Games,".colorize(:white) + " Tickets,".colorize(:white) + " Furniture".colorize(:white) + " or" + " Exit".colorize(:red)
        puts "\nType either" + " 'Video Games',".colorize(:white) + "'Tickets',".colorize(:white) + "'Furniture'".colorize(:white) + " or" +  " 'Exit'.".colorize(:red)

        input = gets.strip.downcase
        case input
        when "video games"
            puts "in" + " Video Games".colorize(:green)
            #scrape the video games page
            url = "https://craigslist.org/"
            categoires = VidgameScraper::Scraper.scrap_catagories(url)
            puts "Link: #{categoires[19].name}"
            puts "URL: #{categoires[19].url}"
    

        when "Tickets"
            puts "In" + " Tickets".colorize(:green)


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