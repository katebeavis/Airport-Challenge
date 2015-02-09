require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do

	let(:airport) {Airport.new(capacity: 10) }
	let(:plane) {Plane.new}
	let(:weather) {Weather.new}

	it 'should have no planes when created' do
		expect(airport.plane_count).to eq 0
	end

	it 'should let planes land' do
		plane.land?
		expect{airport.land(plane)}.to change{airport.plane_count}.by 1
	end

	it 'should let planes take off' do
		airport.land(plane)
		expect{airport.take_off(plane)}.to change{airport.plane_count}.by -1
	end

	it 'should not accept planes and raise an error when full' do
		10.times {airport.land(plane)}
		expect{airport.land(plane)}.to raise_error(RuntimeError, 'Airport is full, the plane cannot land')
	end

	it 'shouldn\'t let a plane take off that isn\'t there' do
		airport.full?
		expect{airport.take_off(plane)}.to raise_error(RuntimeError, 'Airport is empty')
	end

end