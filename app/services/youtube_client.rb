# frozen_string_literal: true

require 'youtube_client/config'
module YoutubeClient
  def self.configuration
    @configuration ||= YoutubeClient::Config.new
  end

  def self.configure
    yield configuration
    configuration
  end
end
require 'youtube_client/base'
