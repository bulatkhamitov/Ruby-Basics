class Interface
    def init_message
    puts "------------------------"
    puts "0 - QUIT"
    puts "1 - create objects"
    puts "2 - change objects"
    puts "3 - see info about objects"
    puts "------------------------"
  end

  def create_message
    puts "------------------------"
    puts "0 - QUIT"
    puts "1 - to create a station"
    puts "2 - to create a route"
    puts "3 - to create a train"
    puts "4 - to create a carriage"
    puts "------------------------"
  end

  def change_message
    puts "------------------------"
    puts "0  - QUIT"
    puts "1  - Add the station to the route"
    puts "2  - Remove the station from the route"
    puts "3  - Put route to the train"
    puts "4  - Add the carriage to the train"
    puts "5  - Remove the carriage from the train"
    puts "6  - Speed up train"
    puts "7  - Slow down train"
    puts "8  - Move forward train"
    puts "9  - Move back train"
    puts "10 - Reserve space in carriage"
    puts "------------------------"
  end

  def train_info
    puts "------------------------"
    puts "0 - QUIT"
    puts "1 - Show speed"
    puts "2 - Show previous station"
    puts "3 - Show current station"
    puts "4 - Show next station"
    puts "5 - Show type"
    puts "6 - Show number"
    puts "7 - Show carriages"
    puts "------------------------"
  end

  def info_message
    puts "------------------------"
    puts "0 - QUIT"
    puts "1 - Train"
    puts "2 - Station"
    puts "3 - Route"
    puts "------------------------"
  end
end
