# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VideoViewsController, type: :controller do
  let(:video_id) { '9bZkp7q19f0' }
  let(:video_vcr) do
    VCR.use_cassette 'youtube/videos/find' do
      YoutubeClient::Video.find(video_id)
    end
  end
  describe 'GET new' do
    subject { get :new, format: :json }
    it { is_expected.to be_success }
  end

  describe 'POST create' do
    before { allow(YoutubeClient::Video).to receive(:find).and_return(video_vcr) }
    subject { post :create, params: { video_view: { video_id: video_id } },  xhr: true }
    it { is_expected.to be_success }
    it { expect(JSON.parse(subject.body)['id']).to eq video_id }
  end
end
