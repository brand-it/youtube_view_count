# frozen_string_literal: true

require 'rails_helper'

RSpec.describe YoutubeClient::Config do
  describe '#initialize' do
    subject { YoutubeClient::Config.new }
    it { expect(subject.uri).to eq('https://www.googleapis.com/youtube/v3') }
    it { expect(subject.verify_ssl).to eq(true) }
    context 'API key is present' do
      before { ENV['YOUTUBE_API_KEY'] = 'Testing API KEY' }
      it { expect(subject.api_key).to eq('Testing API KEY') }
    end

    context 'API key is missing' do
      before { ENV['YOUTUBE_API_KEY'] = nil }
      it { expect { subject }.to raise_exception('YOUTUBE_API_KEY enviorment varable is missing. Won\'t be able to get to youtube') }
    end
  end
end
