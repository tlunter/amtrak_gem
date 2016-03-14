require 'spec_helper'

describe Amtrak::TrainFetcher::MainPage do
  let(:agent) { Mechanize.new }
  describe '#departure_date' do
    subject { described_class.new(nil, '', '', date: date) }
    let(:date) { Date.parse('2014-11-12') }

    it 'prints out a formatted date' do
      expect(subject.departure_date).to eq('11/12/2014')
    end
  end

  describe '#date' do
    subject { described_class.new(nil, '', '', date: date) }

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
      subject { described_class.new(agent, 'pvd', 'bby', date: Date.parse('2016-01-03')) }

      it 'returns 1', :vcr do
        expect(subject.total_pages).to eq(1)
      end
    end

    context 'when more than one page exists on the website' do
      subject { described_class.new(agent, 'pvd', 'bby', date: Date.parse('2015-12-31')) }

      it 'returns 2', :vcr do
        expect(subject.total_pages).to eq(2)
      end
    end
  end
end
