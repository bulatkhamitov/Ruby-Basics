class RailRoad
  def start
    program = Menu.new
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
          program.create_station
        when 2
          program.create_route
        when 3
          program.create_train
        when 4
          program.create_carriage
        end
      when 2
        interface.change_message
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
        when 10
          program.reserve_space
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
end
