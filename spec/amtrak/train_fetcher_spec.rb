require 'spec_helper'

describe Amtrak::TrainFetcher do
  describe '.get', :vcr do
    let(:output) do
      described_class.get('pvd', 'bby', date: Date.parse('2014-11-27'))
    end

    it 'does the same as #get' do
      expect(output.join).to include('route_num')
      expect(output.join).to include('scheduled')
      expect(output.join).to include('act_est')
    end
  end

  describe '#get', :vcr do
    describe 'given a valid date and train stations' do
      subject do
        described_class.new('pvd', 'bby', date: Date.parse('2014-11-27'))
      end

      let(:output) { subject.get }

      it 'includes various classes' do
        expect(output.join).to include('route_num')
        expect(output.join).to include('scheduled')
        expect(output.join).to include('act_est')
      end
    end

    describe 'given an invalid date and valid train stations' do
      subject do
        described_class.new('pvd', 'bby', date: Date.parse('2014-11-6'))
      end

      let(:output) { subject.get }

      it 'does not include various classes and includes an error' do
        expect(output.join).to_not include('route_num')
        expect(output.join).to_not include('scheduled')
        expect(output.join).to_not include('act_est')
      end
    end

    describe 'given a valid date and invalid train stations' do
      subject do
        described_class.new('askdf', 'bby', date: Date.parse('2014-11-27'))
      end

      let(:output) { subject.get }

      it 'does not include various classes and includes an error' do
        expect(output.join).to_not include('route_num')
        expect(output.join).to_not include('scheduled')
        expect(output.join).to_not include('act_est')
      end
    end
  end
end
