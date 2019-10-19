class Train
  attr_reader :speed, :route, :station_index, :carriages, :type, :carriage_counter
  attr_accessor :number

  include InstanceCounter
  include Manufacturer
  include Validation

  @@all_trains = {}

  NUMBER_FORMAT = /^(\d|[a-z]){3}(-(\d|[a-z]){2})*$/i

  validate :number, :format, NUMBER_FORMAT

  def initialize(number, type)
    @number = number
    @type = type
    validate!
    @speed = 0
    @carriages = []
    @carriage_counter = 0
    @@all_trains[@number] = self
    register_instance
  end

  def self.find(number)
    @@all_trains[number]
  end

  def speed_up(add_speed)
    @speed += add_speed
  end

  def decrease_speed(reduce_speed)
    if reduce_speed <= @speed
      @speed -= reduce_speed
    end
  end

  def add_carriage(carriage)
    if @speed == 0 && self.type == carriage.type
      @carriages.push(carriage)
      @carriage_counter += 1
    end
  end

  def remove_carriage(carriage)
    if speed == 0
      @carriages.delete(carriage)
      @carriage_counter -= 1
    end
  end

  def add_route(route)
    @route = route
    @station_index = 0
    current_station.add_train(self)
  end

  def current_station
    @route.stations[@station_index]
  end

  def previous_station
    if @station_index > 0
      @route.stations[@station_index - 1]
    end
  end

  def next_station
    if @station_index < @route.stations.length
      @route.stations[@station_index + 1]
    end
  end

  def move_back
    if previous_station
      current_station.remove_train(self)
      @station_index -= 1
      current_station.add_train(self)
    end
  end

  def move_forward
    if next_station
      current_station.remove_train(self)
      @station_index += 1
      current_station.add_train(self)
    end
  end

  def layout
    @carriages.each { |carriage| yield(carriage) if block_given?}
  end
end
