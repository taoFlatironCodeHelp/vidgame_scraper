class VidgameScraper::CLI

    def start   #instance method
        puts "\n         Welcome to my".colorize(:white) +  " CLI!".colorize(:blue)
        menu
    end

    def menu
        puts "What category do you want deals on today?".colorize(:white)
        puts " \n[1] Video Games,".colorize(:white) + " [2] Tickets,".colorize(:white) + " [3] Furniture".colorize(:white) + " or" + " Exit".colorize(:red)
        puts "\nType either" + " '1',".colorize(:white) + "'2',".colorize(:white) + "'3'".colorize(:white) + " or" +  " 'Exit'.".colorize(:red)

        input = gets.strip.downcase
        case input
        when "1"
            puts "In".colorize(:white) + " Video Games ↓".colorize(:green) + "\nLoading code..."
            
            scrape_video_games
            list_categories
            choose_category            
            # sub_out #loop if user want to conntinue
        when "2"
            puts "In".colorize(:white) + " Tickets ↓".colorize(:green) + "\nLoading code..."
            url = "https://craigslist.org/"
            categories = VidgameScraper::Scraper.scrape_categories(url)
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            puts "Link:".colorize(:white) + " #{categories[15].name}"
            puts "URL: ".colorize(:white) + "  #{categories[15].url}"
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            puts "Done loading"
            sub_out
        when "3"
            puts "In".colorize(:white) + " Furniture ↓".colorize(:green) + "\nLoading code..."
            # url = "https://craigslist.org/"
            # # categories = VidgameScraper::Scraper.scrap_categories(url)
            # puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            # puts "Link:".colorize(:white) + " #{categories[2].name}"
            # puts "URL: ".colorize(:white) + " #{categories[2].url}"
            # puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            sub_out
            
        when "exit"
            puts "Goodbye, Thank you for visiting!".colorize(:red)
        else
            puts "Sorry invalid answer".colorize(:red)
            sub_out
            
            #they input something incorrect
        end
    end 

    def list_categories
        categories = VidgameScraper::Category.all
            puts "Choose which category you want to see the deals for:"
            #lists categories
            #responds to user input when they choose a category

        categories.each.with_index(1) do |category, index|
            puts "#{index}. #{category.name}"
        end
    end

    def choose_category
        puts "\nChoose a category by typing a number:"
        input = gets.strip.to_i
        max_value = VidgameScraper::Category.all.length
        if input.between?(1, max_value)
            category = VidgameScraper::Category.all[input-1]
            display_category_items(category)
            #valid input
        else
            #not valid input
            list_categories
            puts "\nPlease put in a valid input".colorize(:red)
            choose_category
        end
    end

    def display_category_items(category)
        puts "One moment please while the code loads...".colorize(:green)

        VidgameScraper::Scraper.scrape_items(category)
    end

    def scrape_video_games
        # url = "https://www.gamestop.com/video-games" #Gamestop test
        url = "https://austin.craigslist.org/d/video-gaming/search/vga"
        VidgameScraper::Scraper.scrape_categories(url)
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
end