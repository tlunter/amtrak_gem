require 'spec_helper'

describe Amtrak::TrainParser do
  describe '#clean_msg' do
    subject { described_class.new('') }
    let(:output) { subject.clean_msg(message) }

    context 'on a string with no time' do
      let(:message) { 'Scheduled arrival' }
      let(:expected) { nil }

      it 'returns nil' do
        expect(output).to eq(expected)
      end
    end

    context 'on a string with a time' do
      let(:message) { 'Scheduled arrival 3:30 pm' }
      let(:expected) { '3:30 pm' }

      it 'returns the time' do
        expect(output).to eq(expected)
      end
    end

    context 'on a string with only a time' do
      let(:message) { '3:30 pm' }
      let(:expected) { '3:30 pm' }

      it 'returns the time' do
        expect(output).to eq(expected)
      end
    end
  end

  describe '.parse' do
    let(:parser) { double(Amtrak::TrainParser) }
    it 'calls new and parse' do
      expect(described_class).to receive(:new).with('') { parser }
      expect(parser).to receive(:parse)
      described_class.parse('')
    end
  end

  describe '#parse' do
    subject { described_class.new(document) }
    let(:output) { subject.parse }
    let(:document) do
      File.read(File.join('spec', 'fixtures', 'html', 'pvd_to_bby.html'))
    end
    let(:expected) do
      JSON.parse(
        File.read(File.join('spec', 'fixtures', 'json', '_parse.json')),
        symbolize_names: true
      )
    end

    context 'without an error' do
      it 'returns a list of train times' do
        expect(output).to eq(expected)
      end

      context 'with an error' do
        it 'raises a TrainParser::Error' do
          expect(subject.document).to receive(:search) {
            fail Nokogiri::SyntaxError
          }
          expect { output }.to raise_error(Amtrak::TrainParser::Error)
        end
      end
    end
  end
end
