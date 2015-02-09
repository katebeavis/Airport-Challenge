require 'plane'

describe Plane do

	let(:plane) {Plane.new}

	it 'should have a flying status when created' do
		expect(plane).to be_flying
	end

	it 'should not have a flying status when landed' do
		plane.land?
		expect(plane).not_to be_flying
	end

	it 'should be able to take off' do
		plane.take_off?
		expect(plane).to be_flying
	end

	it 'should be able to land' do
		plane.take_off?
		plane.land?
		expect(plane).not_to be_flying
	end

end