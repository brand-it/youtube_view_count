module YoutubeClient
  class Video < YoutubeClient::Base
    def self.find(id)
      get('/videos', query: { id: id, part: :statistics })
    end
  end
end
