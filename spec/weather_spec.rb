require 'weather'
require 'plane'
require 'airport'

describe Weather do

let(:plane) { Plane.new }
let(:airport) { Airport.new }
let(:weather) { Weather.new }

	it 'should know when it\'s sunny' do
		expect(airport).to receive(:weather).and_return(1..6)
		expect(airport).to be_sunny
	end

	it 'should know when it\'s stormy' do
		expect(airport).to receive(:weather).and_return(8..10)
		expect(airport).to be_stormy
	end

	it 'won\'t let a plane land when it\'s stormy' do
		expect(airport).to receive(:weather).and_return(8..10)
		expect{airport.land(plane)}.to raise_error(RuntimeError), 'Too stormy to land'
	end

	it 'should not let a plane take off when it\'s stormy' do
		airport.land(plane)
		expect(airport).to receive(:weather).and_return(8..10)
		expect{airport.take_off(plane)}.to raise_error(RuntimeError), 'Too stormy to take off'
	end






end