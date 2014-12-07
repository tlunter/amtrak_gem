require 'spec_helper'

describe Amtrak do
  context '.get' do
    let(:from) { 'pvd' }
    let(:to) { 'bby' }
    let(:date) { Date.parse('Fri, Dec 5, 2014') }
    let(:output) { described_class.get(from, to, date: date) }
    let(:expected) do
      JSON.parse(
        File.read(File.join('spec', 'fixtures', 'json', '_get.json')),
        symbolize_names: true
      )
    end

    it 'returns a list of train times', :vcr do
      expect(output).to eq(expected)
    end
  end
end
