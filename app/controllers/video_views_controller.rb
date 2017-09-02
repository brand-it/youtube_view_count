# frozen_string_literal: true

class VideoViewsController < ApplicationController
  def new; end

  def create
    render json: YoutubeClient::Video.find(params[:video_view][:video_id])
  end
end
