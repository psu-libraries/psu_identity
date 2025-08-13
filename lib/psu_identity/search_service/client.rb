# frozen_string_literal: true

# @abstract Client for querying Penn State's identity API: https://search-service.k8s.psu.edu/
module PsuIdentity::SearchService
  class Error < StandardError; end

  class NotFound < StandardError; end

  class Client
    # @param [Hash] args of options to pass to the endpoint
    # @option args [String] :text to search for
    def search(**args)
      process_response connection.get('/people', args)
    end

    # @param [Hash] args of options to pass to the endpoint
    # @option args [String] :userid of the person
    def userid(userid)
      process_userid_response connection.get("/people/userid/#{userid}")
    end

    private

      # @return Array<PsuIdentity::SearchService::Person>
      def process_response(response)
        raise Error.new(response.body) unless response.success?

        JSON.parse(response.body).map { |result| Person.new(result) }
      rescue JSON::ParserError
        []
      end

      # @return [PsuIdentity::SearchService::Person, nil]
      def process_userid_response(response)
        raise NotFound if response.status == 404

        raise Error.new(response.body) unless response.success?

        Person.new(JSON.parse(response.body))
      rescue JSON::ParserError
      end

      def connection
        @connection ||= Faraday.new(url: endpoint) do |conn|
          conn.adapter :net_http
        end
      end

      def endpoint
        @endpoint ||= ENV.fetch('IDENTITY_ENDPOINT', 'https://search-service.k8s.psu.edu')
      end
  end
end
