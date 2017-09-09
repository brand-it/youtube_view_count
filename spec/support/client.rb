ENV['YOUTUBE_API_KEY'] ||= 'api_key'
YoutubeClient.configure do |config|
  config.api_key ||= ENV['YOUTUBE_API_KEY']
end