class Station
  attr_reader :name, :trains

  include InstanceCounter
  include Valid

  @@all_stations = []

  NAME_FORMAT = /^[A-Z]+[a-z]{2,20}$/

  def initialize(name)
    @name = name
    validate!
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

  def layout
    @trains.each { |train| yield(train) if block_given?}
  end

  protected

  def validate!
    raise "Name has invalid format!" if name !~ NAME_FORMAT
  end
end
