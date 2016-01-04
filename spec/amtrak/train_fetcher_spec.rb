require 'spec_helper'

describe Amtrak::TrainFetcher do
  describe '.get', :vcr do
    let(:output) do
      described_class.get('pvd', 'bby', date: Date.parse('2015-12-31'))
    end

    it 'does the same as #get' do
      expect(output.join).to include('resp_by_citypair_subheading_trainname')
      expect(output.join).to include('resp_by_citypair_depart_status_details')
      expect(output.join).to include('resp_by_citypair_arrive_status_details')
    end
  end

  describe '#get', :vcr do
    describe 'given a valid date and train stations' do
      subject do
        described_class.new('pvd', 'bby', date: Date.parse('2015-12-31'))
      end

      let(:output) { subject.get }

      it 'includes various classes' do
        expect(output.join).to include('resp_by_citypair_subheading_trainname')
        expect(output.join).to include('resp_by_citypair_depart_status_details')
        expect(output.join).to include('resp_by_citypair_arrive_status_details')
      end
    end

    describe 'given an invalid date and valid train stations' do
      subject do
        described_class.new('pvd', 'bby', date: Date.parse('2014-11-06'))
      end

      let(:output) { subject.get }

      it 'does not include various classes and includes an error' do
        expect(output.join).to_not include('resp_by_citypair_subheading_trainname')
        expect(output.join).to_not include('resp_by_citypair_depart_status_details')
        expect(output.join).to_not include('resp_by_citypair_arrive_status_details')
      end
    end

    describe 'given a valid date and invalid train stations' do
      subject do
        described_class.new('askdf', 'bby', date: Date.parse('2015-12-31'))
      end

      let(:output) { subject.get }

      it 'does not include various classes and includes an error' do
        expect(output.join).to_not include('resp_by_citypair_subheading_trainname')
        expect(output.join).to_not include('resp_by_citypair_depart_status_details')
        expect(output.join).to_not include('resp_by_citypair_arrive_status_details')
      end
    end
  end
end
