# frozen_string_literal: true

class YoutubeClient
  attr_accessor :uri
  def initialize
    self.uri = 'https://www.googleapis.com/youtube/v3'
    self.api_key = ENV['YOUTUBE_API_KEY']
    raise 'YOUTUBE_API_KEY enviorment varable is missing. Won\'t be able to get to youtube' if api_key.nil?
  end
end
