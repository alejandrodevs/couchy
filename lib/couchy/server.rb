# frozen_string_literal: true

module Couchy
  class Server
    include Sphene::Attributes
    include Resources::Database

    ERRORS = {
      not_found: ResouceNotFound
    }.freeze

    DEFAULT_PROTOCOL = "http"
    DEFAULT_HOST = "localhost"
    DEFAULT_PORT = "5984"

    attribute :host, Types::String, default: DEFAULT_HOST
    attribute :port, Types::String, default: DEFAULT_PORT
    attribute :protocol, Types::String, default: DEFAULT_PROTOCOL
    attribute :username, Types::String
    attribute :password, Types::String

    def exec(method, path, data = {})
      body = request(method, path, data).body_str
      response = Oj.load(body, symbol_keys: true)
      raise_response_errors(response)
      response
    end

    def database(name)
      Database.new(name, self)
    end

    private

    def request(method, path, data)
      Curl.send(method, "#{url}/#{path}", data) do |curl|
        if require_request_authentication?
          curl.http_auth_types = :basic
          curl.username = username
          curl.password = password
        end
      end
    end

    def raise_response_errors(response)
      return unless (error = response[:error])
      exception = ERRORS.fetch(error.to_sym, ServerError)
      raise exception, response[:reason]
    end

    def require_request_authentication?
      !username.nil? && !username.empty?
    end

    def url
      "#{protocol}://#{host}#{port_segment}"
    end

    def port_segment
      return if port.nil? || port.empty?
      ":#{port}"
    end
  end
end
