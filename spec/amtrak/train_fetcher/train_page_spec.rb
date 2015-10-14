require 'spec_helper'

describe Amtrak::TrainFetcher::TrainPage do
  subject { described_class.get(session_id, page) }

  describe '#get', :vcr do
    context 'when it works' do
      let(:session_id) { '0000faPsyYZwp2n8Wb_4BDhukyg:187j59p07' }
      let(:page) { '1' }

      it 'includes various classes' do
        expect(subject).to include('resp_by_citypair_subheading_trainname')
        expect(subject).to include('resp_by_citypair_depart_status_details')
        expect(subject).to include('resp_by_citypair_arrive_status_details')
      end
    end

    context 'when Excon raises an error' do
      let(:session_id) { '0000faPsyYZwp2n8Wb_4BDhukyg:187j59p07' }
      let(:page) { '1' }

      it 'reraises as a TrainFetcher::Error' do
        expect(Excon).to receive(:get) {
          fail Excon::Errors::ClientError, ''
        }
        expect { subject }.to raise_error(Amtrak::TrainFetcher::Error)
      end

      it 'reraises as a TrainFetcher::Error' do
        expect(Excon).to receive(:get) {
          fail Excon::Errors::ServerError, ''
        }
        expect { subject }.to raise_error(Amtrak::TrainFetcher::Error)
      end
    end
  end
end
