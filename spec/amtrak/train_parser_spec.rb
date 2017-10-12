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
  end
end
