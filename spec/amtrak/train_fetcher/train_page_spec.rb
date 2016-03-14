require 'spec_helper'

describe Amtrak::TrainFetcher::TrainPage do
  let(:agent) { Mechanize.new }
  subject { described_class.get(agent, page) }

  describe '#get', :vcr do
    context 'when it works' do
      let(:page) { '1' }

      it 'includes various classes' do
        expect(subject).to include('resp_by_citypair_subheading_trainname')
        expect(subject).to include('resp_by_citypair_depart_status_details')
        expect(subject).to include('resp_by_citypair_arrive_status_details')
      end
    end
  end
end
