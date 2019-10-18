class CargoCarriage < Carriage
  include Validation

  validate :cargo_volume, :type, Integer

  def initialize(cargo_volume)
    super("Cargo", cargo_volume)
  end
end
