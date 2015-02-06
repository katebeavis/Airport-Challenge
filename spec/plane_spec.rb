require 'plane'

describe Plane do

	let(:plane) {Plane.new}

	it 'should have a flying status when created' do
		expect(plane).to be_flying
	end

	it 'should not have a flying status when landed' do
		expect(plane).not_to be_landed
	end








end