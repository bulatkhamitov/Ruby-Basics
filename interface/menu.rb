class Menu
  attr_accessor :depots, :routes, :engines, :wagons

  def initialize
    @depots  = [] # stations
    @routes  = [] # routes
    @engines = [] # trains
    @wagons  = [] # carriages
  end

  def create_station
    begin
      puts "------------------------"
      print "Enter the name of the station (i.e. Maryino): "
      station = gets.chomp!
      @depots << Station.new(station)
      puts "Station created successfully."
    rescue
      NameError
      puts "Try again"
      retry
    end
  end

  def create_route
    station_choice
    puts "Enter the first and the last stations to form the route:"
    print "Enter the first station: "
    first = gets.to_i
    print "Enter the last station: "
    last = gets.to_i
    @routes << Route.new(@depots[first], @depots[last])
    puts "Route created successfully."
  end

  def create_train
    puts "------------------------"
    puts "Press 1 to create a passenger train"
    puts "Press 2 to create a cargo train"
    puts "------------------------"
    choice = gets.to_i
    case choice
    when 1
      begin
        create_pass_train
      rescue
        NameError
        puts "Try again"
        retry
      end
    when 2
      begin
        create_cargo_train
      rescue
        NameError
        puts "Try again"
        retry
      end
    end
  end

  def create_carriage
    puts "------------------------"
    puts "Choose 1 to create a passenger carriage"
    puts "Choose 2 to create a cargo carriage"
    puts "------------------------"
    choice = gets.to_i
    case choice
    when 1
      create_pass_carriage
    when 2
      create_cargo_carriage
    end
  end

  def put_route
    train_choice
    tr = gets.to_i
    route_choice
    rt = gets.to_i
    if !@engines[tr].nil? && !@routes[rt].nil?
      @engines[tr].add_route(@routes[rt])
      puts "------------------------"
      puts "Route has been successfully added."
    end
  end

  def put_station
    route_choice
    rt = gets.to_i
    puts "------------------------"
    depots_diff = @depots - @routes[rt].stations
    depots_diff.each_with_index { |station, index| puts "#{station.name} - Station [#{index}]"}
    puts "------------------------"
    puts "Choose the station (by index, i.e. 0, 1, ...):"
    puts "------------------------"
    st = gets.to_i
    puts "------------------------"
    if !@routes.nil? && !depots_diff[st].nil?
      @routes[rt].add_station(depots_diff[st])
      puts "Station has been successfully added."
    end
  end

  def delete_station
    station_choice
    st = gets.to_i
    route_choice
    rt = gets.to_i
    if !@routes.nil? && !@depots[st].nil?
      @routes[rt].remove_station(@depots[st])
      puts "------------------------"
      puts "Station has been successfully removed."
    end
  end

  def put_carriage
    train_choice
    tr = gets.to_i
    carriage_choice
    cr = gets.to_i
    @engines[tr].add_carriage(@wagons[cr])
    puts "------------------------"
    if @engines[tr].carriages.include?(@wagons[cr])
      puts "Carriage added successfully."
      @wagons.delete(@wagons[cr])
    end
  end

  def delete_carriage
    train_choice
    tr = gets.to_i
    puts "------------------------"
    puts "Choose the carriage's number (by index, i.e. 0, 1, ...):"
    @engines[tr].carriages.each_with_index { |carriage, index| puts "#{carriage} - Carriage [#{index}]"}
    cr = gets.to_i
    wagon = @engines[tr].carriages[cr]
    @wagons.push(wagon)
    @engines[tr].remove_carriage(wagon)
    puts "------------------------"
    if !@engines[tr].carriages.include?(@wagons[cr])
      puts "Carriage removed successfully."
    end
  end

  def accelerate
    train_choice
    tr = gets.to_i
    speed_choice
    sp = gets.to_i
    puts "------------------------"
    @engines[tr].speed_up(sp)
  end

  def slow
    train_choice
    tr = gets.to_i
    speed_choice
    sp = gets.to_i
    puts "------------------------"
    @engines[tr].decrease_speed(sp)
  end

  def instant_speed
    train_choice
    tr = gets.to_i
    puts "------------------------"
    puts "Current speed is #{@engines[tr].speed} km/h."
  end

  def forward
    train_choice
    tr = gets.to_i
    @engines[tr].move_forward
  end

  def back
    train_choice
    tr = gets.to_i
    @engines[tr].move_back
  end

  def previous_st
    train_choice
    tr = gets.to_i
    puts "------------------------"
    if !@engines[tr].route.nil?
      puts "Previous station is #{@engines[tr].previous_station.name}."
    end
  end

  def current_st
    train_choice
    tr = gets.to_i
    puts "------------------------"
    if !@engines[tr].route.nil?
      puts "Current station is #{@engines[tr].current_station.name}."
    end
  end

  def next_st
    train_choice
    tr = gets.to_i
    puts "------------------------"
    if !@engines[tr].route.nil?
      puts "Next station is #{@engines[tr].next_station.name}."
    end
  end

  def train_number
    train_choice
    tr = gets.to_i
    puts "------------------------"
    puts @engines[tr].number
  end

  def train_list
    station_choice
    st = gets.to_i
    puts "------------------------"
    @depots[st].layout {|train| puts "Number: #{train.number}, Type: #{train.type}, Number of carriages: #{train.carriage_counter}"}
  end

  def station_list
    route_choice
    rt = gets.to_i
    puts "------------------------"
    @routes[rt].stations.each { |station| puts station.name }
  end

  def carriage_list
    train_choice
    tr = gets.to_i
    puts "------------------------"
    if @engines[tr].instance_of?(PassengerTrain)
      @engines[tr].layout { |carriage| puts "Type: #{carriage.type}, Number: #{carriage.number}, Free seats: #{carriage.free_space}, Occupied seats: #{carriage.occupied_space}" }
    elsif @engines[tr].instance_of?(CarriageTrain)
      @engines[tr].layout { |carriage| puts "Type: #{carriage.type}, Number: #{carriage.number}, Free volume: #{carriage.free_space}, Occupied volume: #{carriage.occupied_space}" }
    end
  end

  def type
    train_choice
    tr = gets.to_i
    puts "------------------------"
    puts @engines[tr].type
  end

  def reserve_space
    train_choice
    tr = gets.to_i
    puts "------------------------"
    puts "Choose the carriage's number (by index, i.e. 0, 1, ...):"
    puts "------------------------"
    @engines[tr].carriages.each_with_index { |carriage, index| puts "#{carriage} - Carriage [#{index}]"}
    puts "------------------------"
    cr = gets.to_i
    carriage = @engines[tr].carriages[cr]
    carriage.take_space
    puts "------------------------"
    if carriage.instance_of?(PassengerCarriage)
      puts "Seat taken."
    elsif carriage.instance_of?(CargoCarriage)
      puts "Cargo loaded."
    end
  end

  private

  def create_pass_train
    puts "------------------------"
    print "Enter the train's number (i.e. AAA-11): "
    number = gets.chomp!
    puts "------------------------"
    @engines << PassengerTrain.new(number)
    puts "Passenger train created successfully."
  end

  def create_cargo_train
    puts "------------------------"
    print "Enter the train's number (i.e. BBB-22): "
    number = gets.chomp!
    puts "------------------------"
    @engines << CargoTrain.new(number)
    puts "Cargo train created successfully."
  end

  def create_pass_carriage
    puts "------------------------"
    print "Enter the total seating capacity: "
    capacity = gets.to_i
    puts "------------------------"
    @wagons << PassengerCarriage.new(capacity)
    puts "Passenger carriage created successfully."
  end

  def create_cargo_carriage
    puts "------------------------"
    print "Enter the total freight volume: "
    freight = gets.to_i
    puts "------------------------"
    @wagons << CargoCarriage.new(freight)
    puts "Cargo carriage created successfully."
  end

  def train_choice
    puts "------------------------"
    @engines.each_with_index { |train, index| puts "#{train.number} - Train [#{index}]"}
    puts "------------------------"
    puts "Choose the train (by index, i.e. 0, 1, ...):"
    puts "------------------------"
  end

  def station_choice
    puts "------------------------"
    @depots.each_with_index { |station, index| puts "#{station.name} - Station [#{index}]"}
    puts "------------------------"
    puts "Choose the station (by index, i.e. 0, 1, ...):"
    puts "------------------------"
  end

  def route_choice
    puts "------------------------"
    @routes.each_with_index { |route, index| puts "#{route} - Route [#{index}]"}
    puts "------------------------"
    puts "Choose the route (by index, i.e. 0, 1, ...):"
    puts "------------------------"
  end

  def carriage_choice
    puts "------------------------"
    @wagons.each_with_index { |carriage, index| puts "#{carriage} - Carriage [#{index}]"}
    puts "------------------------"
    puts "Choose the carriage's number (by index, i.e. 0, 1, ...):"
    puts "------------------------"
  end

  def speed_choice
    puts "------------------------"
    puts "Indicate the speed:"
    puts "------------------------"
  end
end
