require 'airport'
require 'plane'

describe Airport do

	let(:airport) {Airport.new}
	let(:plane) {Plane.new}

	it 'should let planes land' do
		expect{airport.land(plane)}.to change{airport.plane_count}.by 1
	end























end