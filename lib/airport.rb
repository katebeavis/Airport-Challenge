require_relative 'Weather'
require './lib/plane'

class Airport
	DEFAULT_CAPACITY = 10

	include Weather

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@planes = []
		@weather = random_weather
	end

	def plane_count
		@planes.count
	end

	def land(plane)
		raise 'Airport is full, the plane cannot land' if full?
		raise 'Too stormy to land' if stormy?
		plane.land?
		@planes << plane
	end

	# def land_weather(plane)
	# 	raise "Too Stormy!" if random_weather <= 20
	# 	land
	# end

	def take_off(plane)
		raise 'Airport is empty' if empty?
		raise 'Too stormy to take off' if stormy?
		plane.take_off?
		@planes.delete(plane)
	end

	def full?
		plane_count == @capacity
	end

	def empty?
		plane_count == 0
	end























end