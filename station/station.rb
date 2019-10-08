class Station
  attr_reader :name, :trains
  include InstanceCounter
  @@all_stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations.push(self)
    register_instance
  end

  def self.all
    @@all_stations
  end

  def add_train(train)
  	@trains.push(train)
  end

  def remove_train(train)
  	@trains.delete(train)
  end

  def type_count(type)
    @trains.count{ |train| train.type == type}
  end
end
