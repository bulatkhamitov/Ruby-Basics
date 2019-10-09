class PassengerCarriage < Carriage
  attr_reader :seating_capacity, :free_seats

  def initialize(seating_capacity)
    super("Passenger")
    @seating_capacity = seating_capacity
    @free_seats = seating_capacity
  end

  def take_seat(seats = 1)
    @free_seats -= seats unless @free_seats < seats
  end

  def occupied_seats
    @seating_capacity - @free_seats
  end
end
