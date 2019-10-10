class Route
  attr_reader :stations

  include InstanceCounter
  include Valid

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    validate!
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

  protected

  def validate!
    raise "Route has to constist of at least 2 different stations" if start_station == end_station
    raise "Objects are not instances of the class Station" if !start_station.instance_of?(Station) || !end_station.instance_of?(Station)
  end
end
