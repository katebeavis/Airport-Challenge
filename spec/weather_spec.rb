require 'weather'
require 'plane'
require 'airport'

describe Weather do

let(:plane) { Plane.new }
let(:airport) { Airport.new }
let(:weather) { Weather.new }

	it 'should know when it\'s sunny' do
		expect(airport).to receive(:check_weather).and_return(:sunny)
		expect(airport.check_weather).to eq :sunny
	end

	it 'should know when it\'s stormy' do
		expect(airport).to receive(:check_weather).and_return(:stormy)
		expect(airport.check_weather).to eq :stormy
	end

	it 'won\'t let a plane land when it\'s stormy' do
		expect(airport).to receive(:check_weather).and_return (:stormy)
		plane.land?
		expect{airport.land(plane)}.to raise_error(RuntimeError), 'Too stormy to land'
	end

	it 'should not let a plane take off when it\'s stormy' do
		plane.land?
		allow(airport).to receive(:check_weather).and_return(:stormy)
		expect{airport.take_off(plane)}.to raise_error(RuntimeError), 'Too stormy to take off'
	end

end