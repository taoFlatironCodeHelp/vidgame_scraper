class VidgameScraper::CLI

    def start   #instance method
        puts "\n         Welcome to my".colorize(:white) +  " CLI!".colorize(:blue)
        puts "What category do you want deals on today?".colorize(:white)
        puts " \nVideo Game,".colorize(:white) + " Cell Phones,".colorize(:white) + " Furniture".colorize(:white) + " or" + " Exit".colorize(:red)
        puts "\nType either" + " 'Video Game',".colorize(:white) + "'Cell Phones',".colorize(:white) + "'Furniture'".colorize(:white) + " or" +  " 'Exit'.".colorize(:red)

        input = gets.strip.downcase
        case input
        when "video game"
            puts "in" + " Video Games".colorize(:green)
        when "cell phone"
            puts "In" + " Cell Phone".colorize(:green)
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