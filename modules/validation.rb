module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validation_check

    def validate(var_name, val_type, args = [])
      @validation_check ||= []
      @validation_check << [var_name, val_type, args]
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end

    def validate!
      self.class.validation_check.each do |var_name, val_type, args|
        var_name = instance_variable_get("@#{var_name}")
        send(val_type, var_name, args)
      end
    end

    def presence(var_name, args)
      raise "#{var_name} doesn't exist" if var_name.nil?
    end

    def format(var_name, format_template)
      raise "#{var_name} has invalid format, valid format: #{format_template}" if var_name !~ format_template
    end

    def type(var_name, args)
      raise "#{var_name} must have a type of #{args}" unless var_name.is_a? args
    end
  end
end
