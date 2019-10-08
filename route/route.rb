class Route
  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    @stations.delete(station)
  end

  def start_station
    @stations.first
  end

  def end_station
    @stations.last
  end

  def show_stations
    @stations.each { |station| puts "- Station #{station.name}."}
  end
end
