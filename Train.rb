class Train
  attr_reader :tr_number, :speed, :route, :station_index, :carriages, :type

  def initialize(tr_number, type)
    @tr_number = tr_number
    @type = type
    @speed = 0
    @route = nil
    @station_index = nil
    @carriages = []
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
    end
  end

  def remove_carriage(carriage)
    if speed == 0
      @carriages.delete(carriage)
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
end
