require_relative 'weather'
require './lib/plane'

class Airport
  DEFAULT_CAPACITY = 10

  include Weather

  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @planes = []
    @weather = stormy?
  end

  def plane_count
    @planes.count
  end

  def land(plane)
    fail 'Too stormy to land' if stormy?
    fail 'Airport is full, the plane cannot land' if full?
    plane.land?
    @planes << plane
  end

  def take_off(plane)
    fail 'Airport is empty' if empty?
    fail 'Too stormy to take off' if stormy?
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
