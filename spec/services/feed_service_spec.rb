require 'rails_helper'

describe FeedService do
  let(:calendly_url) { 'https://calendly.com/api/v2/users/me/events'}
  let(:response) { instance_double(HTTParty::Response, body: response_body) }
  let(:response_body) do
    JSON.parse(file_fixture("dads_events.json").read)
  end
  subject(:service) { described_class.new }

  describe '#get_events' do
    before do
      allow(HTTParty).to receive(:get).and_return(response)
    end

    it 'returns a ruby hash of calendly events' do
      expect(HTTParty).to have_received(:get).with(calendly_url)
    end
  end
end