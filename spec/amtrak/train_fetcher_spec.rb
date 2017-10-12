require 'spec_helper'

describe Amtrak::TrainFetcher do
  describe '.get', :vcr do
    let(:output) { described_class.get('pvd', 'bby', date: Date.parse('2017-10-12')) }
    let(:segment) { output['journeys'][0]['segments'][0] }

    it 'does the same as #get' do
      expect(segment.keys).to include(
        'originEstimatedDepartureDateTime',
        'originScheduledDepartureDateTime',
        'trainNumber'
      )
    end
  end

  describe '#get', :vcr do
    describe 'given a valid date and train stations' do
      subject do
        described_class.new('pvd', 'bby', date: Date.parse('2017-10-12'))
      end

      let(:output) { subject.get }
      let(:segment) { output['journeys'][0]['segments'][0] }

      it 'includes various keys' do
        expect(segment.keys).to include(
          'originEstimatedDepartureDateTime',
          'originScheduledDepartureDateTime',
          'trainNumber'
        )
      end
    end

    describe 'given an invalid date and valid train stations' do
      subject do
        described_class.new('pvd', 'bby', date: Date.parse('2014-10-12'))
      end

      let(:output) { subject.get }
      let(:error) { output['errors'][0] }

      it 'does not include various keys and includes an error' do
        expect(error['code']).to eq('R602')
        expect(error['text']).to match(/R602/)
      end
    end

    describe 'given a valid date and invalid train stations' do
      subject do
        described_class.new('askdf', 'bby', date: Date.parse('2017-10-12'))
      end

      let(:output) { subject.get }
      let(:error) { output['errors'][0] }

      it 'does not include various keys and includes an error' do
        expect(error['code']).to eq('APPLICATION_ERROR')
        expect(error['text']).to match(/R440/)
      end
    end
  end
end
