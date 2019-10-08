class Message
  def start
    program = Menu.new
    loop do
      init_message
      choice = gets.to_i
      case choice
      when 0
        break
      when 1
        create_message
        choice = gets.to_i
        case choice
        when 0
          break
        when 1
          program.create_station
        when 2
          program.create_route
        when 3
          program.create_train
        when 4
          program.create_carriage
        end
      when 2
        change_message
        choice = gets.to_i
        case choice
        when 0
          break
        when 1
          program.put_station
        when 2
          program.delete_station
        when 3
          program.put_route
        when 4
          program.put_carriage
        when 5
          program.delete_carriage
        when 6
          program.accelerate
        when 7
          program.slow
        when 8
          program.forward
        when 9
          program.back
        end
      when 3
        info_message
        choice = gets.to_i
        case choice
        when 0
          break
        when 1
          train_info
          choice = gets.to_i
          case choice
          when 0
            break
          when 1
            program.instant_speed
          when 2
            program.previous_st
          when 3
            program.current_st
          when 4
            program.next_st
          when 5
            program.type
          when 6
            program.train_number
          when 7
            program.carriage_list
          end
        when 2
          program.train_list
        when 3
          program.station_list
        end
      end
    end
  end

  private

  def init_message
    puts "------------------------"
    puts "0 - QUIT"                   # -> break
    puts "1 - create objects"         # -> create_message
    puts "2 - change objects"         # -> change_message
    puts "3 - see info about objects" # -> info_message
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
    puts "0 - QUIT"
    puts "1 - Add the station to the route"
    puts "2 - Remove the station from the route"
    puts "3 - Put route to the train"
    puts "4 - Add the carriage to the train"
    puts "5 - Remove the carriage from the train"
    puts "6 - Speed up train"
    puts "7 - Slow down train"
    puts "8 - Move forward train"
    puts "9 - Move back train"
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
