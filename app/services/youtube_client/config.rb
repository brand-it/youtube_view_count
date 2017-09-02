module YoutubeClient
  class Config
    attr_accessor :uri, :api_key, :verify_ssl
    def initialize
      self.uri = 'https://www.googleapis.com/youtube/v3'
      self.api_key = ENV['YOUTUBE_API_KEY']
      self.verify_ssl = true
      raise 'YOUTUBE_API_KEY enviorment varable is missing. Won\'t be able to get to youtube' if api_key.nil?
    end
  end
end
