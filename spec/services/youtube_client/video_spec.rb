# frozen_string_literal: true

require 'rails_helper'

RSpec.describe YoutubeClient::Video do
  describe '.find' do
    subject do
      VCR.use_cassette 'youtube/videos/find' do
        YoutubeClient::Video.find('9bZkp7q19f0')
      end
    end
    it { is_expected.to be_a(Hash) }
    it { expect(subject['id']).to eq('9bZkp7q19f0') }
    it { expect(subject['snippet']['title']).to eq('PSY - GANGNAM STYLE(강남스타일) M/V') }
    it { expect(subject['statistics']['viewCount']).to eq('2946717468') }
  end
end