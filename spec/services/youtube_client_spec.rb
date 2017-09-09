# frozen_string_literal: true

require 'rails_helper'

RSpec.describe YoutubeClient do
  describe '.configuration' do
    subject { YoutubeClient.configuration }
    it { is_expected.to be_a(YoutubeClient::Config) }
  end

  describe '.configure' do
    subject! do
      YoutubeClient.configure do |config|
        config.uri = 'uri'
        config.api_key = 'api_key'
        config.verify_ssl = 'verify_ssl'
      end
    end
    it { expect(YoutubeClient.configuration.uri).to eq 'uri' }
    it { expect(YoutubeClient.configuration.api_key).to eq 'api_key' }
    it { expect(YoutubeClient.configuration.verify_ssl).to eq 'verify_ssl' }
  end
end
