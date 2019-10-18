module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :valid_check

    def validate(name, val_type, args = [])
      @valid_check ||= []
      @valid_check.push([name, val_type, args])
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
      self.class.valid_check.each do |var_name, val_type, args|
        var_name = instance_variable_get("@#{var_name}")
        val_type = "#{val_type}"
        send(val_type, var_name, args)
      end
    end

    def presence(var_name)
      raise "#{var_name} doesn't exist" if var_name.nil?
    end

    def format(var_name, format_tmpl)
      raise "#{var_name} has invalid format, valid format: #{format_tmpl}" if !(var_name =~ format_tmpl)
    end

    def type(var_name, val_type)
      raise "#{var_name} must have a type of #{val_type}"  if !var_name.is_a? val_type
    end
  end
end
