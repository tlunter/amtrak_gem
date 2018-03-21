require 'spec_helper'

describe Amtrak::TrainParser do
  describe '.parse' do
    let(:parser) { double(Amtrak::TrainParser) }

    it 'calls new and parse' do
      expect(described_class).to receive(:new).with('journeys' => []) { parser }
      expect(parser).to receive(:parse)
      described_class.parse('journeys' => [])
    end
  end

  describe '#parse' do
    subject { described_class.new(json) }
    let(:output) { subject.parse }
    let(:json) { JSON.parse(document) }
    let(:document) do
      File.read(File.join('spec', 'fixtures', 'json', 'pvd_to_bby.json'))
    end
    let(:expected) do
      JSON.parse(
        File.read(File.join('spec', 'fixtures', 'json', '_parse.json')),
        symbolize_names: true
      )
    end

    it 'returns a list of train times' do
      expect(output).to eq(expected)
    end

    context 'when the train status is canceled' do
      let(:document) do
        File.read(File.join('spec', 'fixtures', 'json', 'canceled.json'))
      end
      let(:expected) do
        JSON.parse(
          File.read(File.join('spec', 'fixtures', 'json', '_parse_canceled.json')),
          symbolize_names: true
        )
      end

      it 'puts canceled in the time field' do
        expect(output).to eq(expected)
      end
    end

    context 'when the train status is unavailable' do
      let(:document) do
        File.read(File.join('spec', 'fixtures', 'json', 'unavailable.json'))
      end

      it 'does not return any trains' do
        expect(output).to eq([])
      end
    end

    context 'when the train is not operated by amtrak' do
      let(:document) do
        File.read(File.join('spec', 'fixtures', 'json', 'not_operated_by_amtrak.json'))
      end

      it 'does not return any trains' do
        expect(output).to eq([])
      end
    end
  end
end
