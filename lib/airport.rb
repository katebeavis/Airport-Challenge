class Airport
	DEFAULT_CAPACITY = 10

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@planes = []
	end

	def plane_count
		@planes.count
	end

	def land(plane)
		raise 'Airport is full, the plane cannot land' if full?
		@planes << plane
	end

	def take_off(plane)
		raise 'Airport is empty' if empty?
		@planes.delete(plane)
	end

	def full?
		plane_count == @capacity
	end

	def empty?
		plane_count == 0
	end

	def weather
		create_weather = ["sunny", "stormy"].sample
	end

	def stormy?
		storm = "stormy"
	end

	def take_off_if_stormy(plane)
		raise 'Too stormy to take off' if weather = "stormy"
	end























end