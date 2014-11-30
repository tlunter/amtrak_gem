require 'spec_helper'

describe Amtrak::TrainParser do
  describe '#remove_parentheses' do
    subject { described_class.new('') }
    let(:output) { subject.remove_parentheses(message) }

    context 'on a string with no surrounding parentheses' do
      let(:message) { '3:30 pm' }
      let(:expected) { '3:30 pm' }

      it 'returns the statement' do
        expect(output).to eq(expected)
      end
    end

    context 'on a string with a leading parentheses' do
      let(:message) { '(3:30 pm' }
      let(:expected) { '(3:30 pm' }

      it 'returns the statement' do
        expect(output).to eq(expected)
      end
    end

    context 'on a string with a trailing parentheses' do
      let(:message) { '3:30 pm)' }
      let(:expected) { '3:30 pm)' }

      it 'returns the statement' do
        expect(output).to eq(expected)
      end
    end

    context 'on a string with surrounding parentheses' do
      let(:message) { '(3:30 pm)' }
      let(:expected) { '3:30 pm' }

      it 'returns the statement without parentheses' do
        expect(output).to eq(expected)
      end
    end
  end

  describe '#make_datetime' do
    subject { described_class.new('') }
    let(:output) { subject.make_datetime(date, time) }

    context 'given no date' do
      let(:date) { nil }
      let(:time) { '3:30 pm' }

      it 'returns nil' do
        expect(output).to be_nil
      end
    end

    context 'given no time' do
      let(:date) { 'Wed Nov 19, 2014' }
      let(:time) { nil }

      it 'returns nil' do
        expect(output).to be_nil
      end
    end

    context 'given a string date and time' do
      let(:date) { 'Wed Nov 19, 2014' }
      let(:time) { '3:30 pm' }
      let(:expected) { DateTime.new(2014, 11, 19, 15, 30) }

      it 'returns a datetime' do
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

    context 'without an error' do
      it 'returns a list of train times' do
        expect(output).to eq([
          {
            number: 174,
            departure: {
              scheduled_date: 'Wed Nov 19, 2014',
              estimated_date: '',
              scheduled_time: '5:30 pm',
              estimated_time: '5:52 pm'
            },
            arrival: {
              scheduled_date: 'Wed Nov 19, 2014',
              estimated_date: 'Wed Nov 19, 2014',
              scheduled_time: '6:25 pm',
              estimated_time: '6:27 pm'
            }
          },
          {
            number: 2164,
            departure: {
              scheduled_date: 'Wed Nov 19, 2014',
              estimated_date: '',
              scheduled_time: '5:50 pm',
              estimated_time: '6:45 pm'
            },
            arrival: {
              scheduled_date: 'Wed Nov 19, 2014',
              estimated_date: 'Wed Nov 19, 2014',
              scheduled_time: '6:34 pm',
              estimated_time: '7:14 pm'
            }
          },
          {
            number: 2166,
            departure: {
              scheduled_date: 'Wed Nov 19, 2014',
              estimated_date: '',
              scheduled_time: '6:54 pm',
              estimated_time: ''
            },
            arrival: {
              scheduled_date: 'Wed Nov 19, 2014',
              estimated_date: 'Wed Nov 19, 2014',
              scheduled_time: '7:35 pm',
              estimated_time: '7:28 pm'
            }
          },
          {
            number: 176,
            departure: {
              scheduled_date: 'Wed Nov 19, 2014',
              estimated_date: 'Wed Nov 19, 2014',
              scheduled_time: '7:19 pm',
              estimated_time: '7:22 pm'
            },
            arrival: {
              scheduled_date: 'Wed Nov 19, 2014',
              estimated_date: 'Wed Nov 19, 2014',
              scheduled_time: '8:06 pm',
              estimated_time: '7:51 pm'
            }
          },
          {
            number: 2168,
            departure: {
              scheduled_date: 'Wed Nov 19, 2014',
              estimated_date: 'Wed Nov 19, 2014',
              scheduled_time: '7:56 pm',
              estimated_time: '7:57 pm'
            },
            arrival: {
              scheduled_date: 'Wed Nov 19, 2014',
              estimated_date: 'Wed Nov 19, 2014',
              scheduled_time: '8:38 pm',
              estimated_time: '8:34 pm'
            }
          },
          {
            number: 2170,
            departure: {
              scheduled_date: 'Wed Nov 19, 2014',
              estimated_date: 'Wed Nov 19, 2014',
              scheduled_time: '8:54 pm',
              estimated_time: '8:55 pm'
            },
            arrival: {
              scheduled_date: 'Wed Nov 19, 2014',
              estimated_date: 'Wed Nov 19, 2014',
              scheduled_time: '9:34 pm',
              estimated_time: '9:32 pm'
            }
          },
          {
            number: 94,
            departure: {
              scheduled_date: 'Wed Nov 19, 2014',
              estimated_date: 'Wed Nov 19, 2014',
              scheduled_time: '9:16 pm',
              estimated_time: '9:22 pm'
            },
            arrival: {
              scheduled_date: 'Wed Nov 19, 2014',
              estimated_date: 'Wed Nov 19, 2014',
              scheduled_time: '10:02 pm',
              estimated_time: '9:51 pm'
            }
          },
          {
            number: 2172,
            departure: {
              scheduled_date: 'Wed Nov 19, 2014',
              estimated_date: 'Wed Nov 19, 2014',
              scheduled_time: '9:54 pm',
              estimated_time: '9:55 pm'
            },
            arrival: {
              scheduled_date: 'Wed Nov 19, 2014',
              estimated_date: 'Wed Nov 19, 2014',
              scheduled_time: '10:35 pm',
              estimated_time: '10:32 pm'
            }
          }
        ])
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
