require_relative "modules/module_manufacturer.rb"
require_relative "modules/module_instance_counter.rb"
require_relative "modules/module_valid.rb"

require_relative "station/station.rb"
require_relative "route/route.rb"

require_relative "trains/train.rb"
require_relative "trains/cargo_train.rb"
require_relative "trains/passenger_train.rb"

require_relative "carriages/carriage.rb"
require_relative "carriages/passenger_carriage.rb"
require_relative "carriages/cargo_carriage.rb"

require_relative "interface/interface.rb"
require_relative "interface/menu.rb"
require_relative "interface/railroad.rb"

program = RailRoad.new
program.start
