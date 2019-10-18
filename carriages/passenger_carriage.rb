class PassengerCarriage < Carriage
  include Validation

  validate :seat_capacity, :type, Integer

  def initialize(seat_capacity)
    super("Passenger", seat_capacity)
  end

  def take_space
    super(1)
  end
end
