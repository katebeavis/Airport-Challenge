require_relative 'Weather'

class Airport
	DEFAULT_CAPACITY = 10

	include Weather

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@planes = []
	end

	def plane_count
		@planes.count
	end

	def land(plane)
		raise 'Airport is full, the plane cannot land' if full?
		raise 'Too stormy to land' if stormy?
		@planes << plane
	end

	# def land_weather(plane)
	# 	raise "Too Stormy!" if random_weather <= 20
	# 	land
	# end

	def take_off(plane)
		raise 'Airport is empty' if empty?
		raise 'Too stormy to take off' if stormy?
		@planes.delete(plane)
	end

	def full?
		plane_count == @capacity
	end

	def empty?
		plane_count == 0
	end























end