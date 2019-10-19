class RailRoad
  def start
    programme = Menu.new
    interface = Interface.new
    loop do
      interface.init_message
      choice = gets.to_i
      case choice
      when 0
        break        
      when 1
        interface.create_message
        choice = gets.to_i
        case choice
        when 0
          break
        when 1
          programme.create_station
        when 2
          programme.create_route
        when 3
          programme.create_train
        when 4
          programme.create_carriage
        end
      when 2
        interface.change_message
        choice = gets.to_i
        case choice
        when 0
          break
        when 1
          programme.put_station
        when 2
          programme.delete_station
        when 3
          programme.put_route
        when 4
          programme.put_carriage
        when 5
          programme.delete_carriage
        when 6
          programme.accelerate
        when 7
          programme.slow
        when 8
          programme.forward
        when 9
          programme.back
        when 10
          programme.reserve_space
        end
      when 3
        interface.info_message
        choice = gets.to_i
        case choice
        when 0
          break
        when 1
          interface.train_info
          choice = gets.to_i
          case choice
          when 0
            break
          when 1
            programme.instant_speed
          when 2
            programme.previous_st
          when 3
            programme.current_st
          when 4
            programme.next_st
          when 5
            programme.type
          when 6
            programme.train_number
          when 7
            programme.carriage_list
          end
        when 2
          programme.train_list
        when 3
          programme.station_list
        end
      end
    end
  end
end
