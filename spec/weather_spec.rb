require 'weather'
require 'plane'
require 'airport'

describe Weather do
	let(:plane) { Plane.new }
	let(:airport) { Airport.new }

	it 'won\'t let a plane land when it\'s stormy' do
		expect(airport).to receive(:stormy?).and_return(true)
		plane.land?
		expect { airport.land(plane) }.to raise_error(RuntimeError), 'Too stormy to land'
	end

	it 'should not let a plane take off when it\'s stormy' do
		plane.land?
		allow(airport).to receive(:stormy?).and_return(true)
		expect { airport.take_off(plane) }.to raise_error(RuntimeError), 'Too stormy to take off'
	end
end
