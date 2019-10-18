module Accessor
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      history_var_name = "@#{name}_history".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}_history".to_sym) { instance_variable_get(history_var_name) }
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        instance_variable_set(history_var_name, []) if instance_variable_get(history_var_name).nil?
        instance_variable_set(history_var_name, instance_variable_get(history_var_name) << value)
      end
    end
  end

  def strong_attr_accessor(attr_name, class_name)
    var_name = "@#{attr_name}".to_sym
    define_method(attr_name) { instance_variable_get(var_name) }
    define_method("#{attr_name}=".to_sym) do |value|
      raise ArgumentError if !value.is_a? class_name
      instance_variable_set(var_name, value)
    end
  end
end

class Test
  extend Accessor
  include Validation

  attr_accessor_with_history :a, :b
  strong_attr_accessor :s, String

  validate :a, :presence
  validate :a, :format, /[0-9]{3}/
  validate :a, :type, String

  def initialize(inpt)
    @a = inpt
  end
end
