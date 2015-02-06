require 'airport'
require 'plane'

describe Airport do

	let(:airport) {Airport.new(capacity: 10) }
	let(:plane) {Plane.new}

	it 'should let planes land' do
		expect{airport.land(plane)}.to change{airport.plane_count}.by 1
	end

	it 'should let planes take off' do
		airport.land(plane)
		expect{airport.take_off(plane)}.to change{airport.plane_count}.by -1
	end

	it 'should not accept planes and raise an error when full' do
		10.times {airport.land(plane)}
		expect{airport.land(plane)}.to raise_error(RuntimeError, 'Airport is full')
	end

	# it 'shouldn\'t let a plane take off that isn\'t there' do
		
	# end























end