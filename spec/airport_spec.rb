require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do

	let(:airport) {Airport.new(capacity: 10) }
	let(:plane) {Plane.new}
	let(:weather) {Weather.new}

	it 'should let planes land' do
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


	 # it "should randomly return stormy or sunny" do
  #       expect(airport.sunny_storm).to satisfy{|s| ["stormy", "sunny"].include?(s)}
  #       # this is completely random between sunny and stormy
  #   end

 #    it "should not take off if weather is stormy" do
 #    	airport.stormy?
 #    	expect{airport.take_off_if_stormy(plane)}.to raise_error(RuntimeError, 'Too stormy to take off')
	# end

	    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport























end