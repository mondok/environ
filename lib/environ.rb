require "environ/version"

# Public: Main handler for accessing variables
module Environ
	module_function

  # Public: Returns all environment variables as hash
  #
  # Examples
  #
  #  Environ.all => {"PATH"=>"/Users/someone/.rvm/gems/ruby-2.2.0/bin", "RUBY_VERSION"=>"ruby-2.2.0", "_"=>"/Users/someone/.rvm/rubies/ruby-2.2.0/bin/irb"}
  #
  # returns hash of all variables
	def all
		ENV
	end

	def method_missing(method, *args, &block)
		if (method.to_s =~ /env_/)
			create_method(method.to_s, nil)
			nil
		else
			super.method_missing(method, *args, &block)
		end
	end

  # Public: Dynamically defines singleton methods from ENV
  #
  # Examples
  #
  #  Environ.create_methods
  #
  # returns nothing
	def create_methods
		ENV.each do |key, val|
			create_method(key, val)
		end
	end

  # Public: Dynamically defines a singleton method
  #
  # Examples
  #
  #  Environ.create_method('path', 'something')
  #
  # returns nothing
	def create_method(name, val)
		define_singleton_method("env_#{name.strip.downcase}") do
			val
		end
	end

  # initialize methods
	self.create_methods

end
