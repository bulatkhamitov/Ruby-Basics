module Valid
 	def valid?
 	  validate!
    true
  rescue RuntimeError
    false
  end
end
