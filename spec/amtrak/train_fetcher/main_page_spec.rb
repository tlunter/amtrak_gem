require 'spec_helper'

describe Amtrak::TrainFetcher::MainPage do
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

  describe '#total_pages' do
    context 'when only one page exists on the website' do
      subject { described_class.new('pvd', 'bby', date: Date.parse('2014-12-07')) }

      it 'returns 1', :vcr do
        expect(subject.total_pages).to eq(1)
      end
    end

    context 'when more than one page exists on the website' do
      subject { described_class.new('pvd', 'bby', date: Date.parse('2014-12-06')) }

      it 'returns 2', :vcr do
        expect(subject.total_pages).to eq(2)
      end
    end
  end

  describe '#session_id' do
    subject { described_class.new('pvd', 'bby', date: Date.parse('2014-12-06')) }
    it 'pulls the session id from the cookies', :vcr do
      expect(subject.session_id).to eq('0000faPsyYZwp2n8Wb_4BDhukyg:187j59p07')
    end
  end

  describe '#request' do
    context 'when Excon raises' do
      subject { described_class.new('', '') }

      it 'returns a TrainFetcher::Error' do
        expect(Excon).to receive(:post) { fail Excon::Errors::ClientError, '' }
        expect { subject.request }.to raise_error(Amtrak::TrainFetcher::Error)
      end

      it 'returns a TrainFetcher::Error' do
        expect(Excon).to receive(:post) { fail Excon::Errors::ServerError, '' }
        expect { subject.request }.to raise_error(Amtrak::TrainFetcher::Error)
      end
    end
  end
end
