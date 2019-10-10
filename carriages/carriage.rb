class Carriage
  attr_reader :type, :number, :total_space, :free_space

  @@carriage_number = 1

  include Manufacturer

  def initialize(type, number = @@carriage_number, total_space)
    @type = type
    @number = number
    @@carriage_number += 1
    @total_space = total_space
    @free_space = total_space
  end

  def take_space(space)
    @free_space -= space unless space > @free_space
  end

  def occupied_space
    @total_space - @free_space
  end
end
