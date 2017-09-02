# frozen_string_literal: true

require 'httparty'

module YoutubeClient
  class NotFound < StandardError; end
  class AccessDenied < StandardError; end
  class InternalServerError < StandardError; end
  class Redirect < StandardError; end

  class Base
    include HTTParty

    # header defaults that don't change
    headers 'Content-Type' => 'application/json'
    headers 'Accept' => 'application/json'

    def self.setup
      Base.base_uri(YoutubeClient.configuration.uri.to_s)
      if YoutubeClient.configuration.api_key.to_s == '' # Checking if it is blank not just nil
        raise YoutubeClient::AuthenticationError, 'api key is missing'
      end
      Base.default_options.update(verify: YoutubeClient.configuration.verify_ssl)
    end

    def self.get(path, options = {})
      setup
      results = super(path, options)
      verify_response(results)
      objectize(results)
    end

    def self.headers
      super.merge(
        'key' => YoutubeClient.configuration.api_key
      )
    end

    # Don't need a post in this case but here it is anyway
    # def post(path, options = {})
    #   Base.post URI.join(YoutubeClient.configuration.host, path).path, options
    # end
    def self.objectize(parsed_response)
      return parsed_response if name == 'YoutubeClient::Base'
      new(parsed_response)
    end

    def self.verify_response(results) # rubocop:disable MethodLength, AbcSize
      case results.response.code.to_i
      when 401
        raise YoutubeClient::AccessDenied, "#{results.request.last_uri}\n#{results.parsed_response}"
      when 404
        raise YoutubeClient::NotFound, "Record Not Found\n#{results.request.last_uri}"
      when 200
        true
      when 302
        raise(
          YoutubeClient::Redirect,
          "Some how we got redirected but I don't know how to handle this\n"\
          "#{results.request.last_uri} #{results.parsed_response}\n#{results.request.query}"
        )
      else
        extra_info = "\n#{results.request.inspect}" if Rails.env.development? || Rails.env.test?
        raise(
          YoutubeClient::InternalServerError,
          "(#{results.response.code}) Unknow Response\n#{results.request.last_uri}\n#{results.parsed_response}#{extra_info}"
        )
      end
    end
  end
end
