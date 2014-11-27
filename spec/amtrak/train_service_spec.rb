require 'spec_helper'

describe Amtrak::TrainService do
  describe '.get', :vcr do
    let(:output) do
      described_class.get('pvd', 'bby', date: Date.parse('2014-11-13'))
    end

    it 'does the same as #get' do
      expect(output).to include('route_num')
      expect(output).to include('scheduled')
      expect(output).to include('act_est')
    end
  end

  describe '#get', :vcr do
    describe 'given a valid date and train stations' do
      subject do
        described_class.new('pvd', 'bby', date: Date.parse('2014-11-13'))
      end

      let(:output) { subject.get }

      it 'includes various classes' do
        expect(output).to include('route_num')
        expect(output).to include('scheduled')
        expect(output).to include('act_est')
      end
    end

    describe 'given an invalid date and valid train stations' do
      subject do
        described_class.new('pvd', 'bby', date: Date.parse('2014-11-6'))
      end

      let(:output) { subject.get }

      it 'does not include various classes and includes an error' do
        expect(output).to_not include('route_num')
        expect(output).to_not include('scheduled')
        expect(output).to_not include('act_est')
        expect(output).to include('Problem with Train Status Date')
      end
    end

    describe 'given a valid date and invalid train stations' do
      subject do
        described_class.new('askdf', 'bby', date: Date.parse('2014-11-13'))
      end

      let(:output) { subject.get }

      it 'does not include various classes and includes an error' do
        expect(output).to_not include('route_num')
        expect(output).to_not include('scheduled')
        expect(output).to_not include('act_est')
        expect(output).to include(
          'Problem with Departure Station or City Name'
        )
      end
    end
  end

  describe '#departure_date' do
    subject { described_class.new('', '', date: date) }
    let(:date) { Date.parse('2014-11-12') }

    it 'prints out a formatted date' do
      expect(subject.departure_date).to eq('Wed, Nov 12, 2014')
    end
  end

  describe '#date' do
    subject { described_class.new('', '', date: date) }

    context 'on an instance with a date' do
      let(:date) { Date.parse('2014-11-12') }

      it 'returns the set date' do
        expect(subject.date).to eq(date)
      end
    end

    context 'on an instance without a date' do
      let(:date) { nil }
      let(:stubbed_date) { Date.parse('2014-11-12') }

      it 'returns the current date' do
        expect(Date).to receive(:today).and_return(stubbed_date)
        expect(subject.date).to eq(stubbed_date)
      end
    end
  end
end
