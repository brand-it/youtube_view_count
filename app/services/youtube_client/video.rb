module YoutubeClient
  class Video < YoutubeClient::Base
    attr_accessor :items
    def initialize(results)
      self.items = results.parsed_response['items']
    end

    def self.find(id)
      get('/videos', query: { id: id, part: 'statistics,snippet' }).items.first
    end
  end
end
