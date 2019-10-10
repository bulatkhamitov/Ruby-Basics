class PassengerCarriage < Carriage
  def initialize(seating_capacity)
    super("Passenger", seating_capacity)
  end

  def take_space
    super(1)
  end
end
