require_relative "environ/version"

# Public: Main handler for accessing variables
module Environ
	module_function
	@_data = {}
	@_no_conflict = true

	# Public: Returns boolean indicating whether no conflict prefixing is on or off
  #
  # Examples
  #
  #  Environ.no_conflict => true
  #
  # returns boolean
	def no_conflict
		@_no_conflict
	end

	# Public: Sets boolean indicating whether no conflict prefixing is on or off
	# If set to false, env vars can be accessed without the 'env_' prefix
	# Examples
	#
	#  Environ.no_conflict = false
	#  Environ.path => {"PATH"=>"/Users/someone/.rvm/gems/ruby-2.2.0/bin", "RUBY_VERSION"=>"ruby-2.2.0", "_"=>"/Users/someone/.rvm/rubies/ruby-2.2.0/bin/irb"}
	#
	# returns nothing
	def no_conflict=(value)
		@_no_conflict = value
		create_methods unless @_no_conflict
	end

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

	# Public: Resets all environment variables back to their original values
  #
  # Examples
  #
  #  Environ.reset!
  #
  # returns nothing
	def reset!
		@_data.clear
		create_methods
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
		var_prefix = @_no_conflict ? 'env_' : ''
		var_name = "#{var_prefix}#{name.strip.downcase}"
		@_data[var_name] = val
		define_singleton_method(var_name) do
			@_data[var_name]
		end

		define_singleton_method(:"#{var_name}=") do |value|
			@_data[var_name] = value
		end
	end

  # initialize methods
	self.create_methods

end
