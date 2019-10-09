class CargoCarriage < Carriage
  attr_reader :freight_volume, :free_volume

  def initialize(freight_volume)
    super("Cargo")
    @freight_volume = freight_volume
    @free_volume = freight_volume
  end

  def load_freight(freight = 5)
    @free_volume -= freight unless freight > @free_volume
  end

  def occupied_volume
    @freight_volume - @free_volume
  end
end
