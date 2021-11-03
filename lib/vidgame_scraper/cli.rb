class VidgameScraper::CLI

    def start   #instance method
        puts "\n         Welcome to my".colorize(:white) +  " CLI!".colorize(:blue)
        puts "What category do you want deals on today?".colorize(:white)
        puts " \n[1] Video Games,".colorize(:white) + " [2] Tickets,".colorize(:white) + " [3] Furniture".colorize(:white) + " or" + " Exit".colorize(:red)
        puts "\nType either" + " '1',".colorize(:white) + "'2',".colorize(:white) + "'3'".colorize(:white) + " or" +  " 'Exit'.".colorize(:red)

        input = gets.strip.downcase
        case input
        when "1"
            puts "In".colorize(:white) + " Video Games ↓".colorize(:green)
            #scrape the video games page
            url = "https://craigslist.org/"
            categoires = VidgameScraper::Scraper.scrap_catagories(url)
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            puts "Link:".colorize(:white) + " #{categoires[19].name}"
            puts "URL: ".colorize(:white) + " #{categoires[19].url}"
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            sub_out
            

    

        when "2"
            puts "In".colorize(:white) + " Tickets ↓".colorize(:green)
            url = "https://craigslist.org/"
            categoires = VidgameScraper::Scraper.scrap_catagories(url)
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            puts "Link:".colorize(:white) + " #{categoires[15].name}"
            puts "URL: ".colorize(:white) + "  #{categoires[15].url}"
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            sub_out



        when "3"
            puts "In".colorize(:white) + " Furniture ↓".colorize(:green)
            url = "https://craigslist.org/"
            categoires = VidgameScraper::Scraper.scrap_catagories(url)
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            puts "Link:".colorize(:white) + " #{categoires[2].name}"
            puts "URL: ".colorize(:white) + " #{categoires[2].url}"
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            sub_out
            

        when "exit"
            puts "Goodbye, Thank you for visiting!".colorize(:red)
        else
            puts "Sorry invalid answer".colorize(:red)
            sub_out
            
            #they input something incorrect
        end
    
    end
end


    def sub_out 
        puts "Would like to see the list again?".colorize(:white) + " (" + "'y'".colorize(:green) + "/" + "'n'".colorize(:red) + ")" 
        answers = gets.strip.downcase
        case answers
        when "y"
            start
        when "n"
            exit_program
        else
            puts "Invalid input. Please try again".colorize(:red)
            sub_out
        end
    end



def exit_program
    puts "Goodbye, Thank you for visiting!".colorize(:red)
end