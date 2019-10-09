class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
  	@trains.push(train)
  end

  def remove_train(train)
  	@trains.delete(train)
  end

  def type_count(type)
    @trains.count { |train| train.type == type}
  end
end
