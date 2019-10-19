class Carriage
  include Manufacturer
  include Validation

  attr_reader :type, :number, :total_space, :free_space

  validate :total_space, :type, Numeric

  @@carriage_number = 1

  def initialize(type, number = @@carriage_number, total_space)
    @type = type
    @number = number
    @total_space = total_space
    @free_space = total_space
    validate!
    @@carriage_number += 1
  end

  def take_space(space)
    @free_space -= space unless @free_space < space
  end

  def occupied_space
    @total_space - @free_space
  end
end
