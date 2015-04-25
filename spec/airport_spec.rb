require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do
  subject { described_class.new(capacity: 10) }
  let(:plane) { Plane.new }

  it 'has no planes when created' do
    expect(subject.plane_count).to eq 0
  end

  before do
    allow(subject).to receive(:stormy?).and_return false
  end

  it 'lets planes land' do
    plane.land?
    expect { subject.land(plane) }.to change { subject.plane_count }.by 1
  end

  it 'lets planes take off' do
    subject.land(plane)
    expect { subject.take_off(plane) }.to change { subject.plane_count }.by(-1)
  end

  it 'does not accept planes and raise an error when full' do
    10.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error(RuntimeError, 'Airport is full, the plane cannot land')
  end

  it 'does not let a plane take off that is not there' do
    subject.full?
    expect { subject.take_off(plane) }.to raise_error(RuntimeError, 'Airport is empty')
  end
end
