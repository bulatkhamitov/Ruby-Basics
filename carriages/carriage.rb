class Carriage
  attr_reader :type, :number

  @@carriage_number = 1

  include Manufacturer

  def initialize(type, number = @@carriage_number)
    @type = type
    @number = number
    @@carriage_number += 1
  end
end
