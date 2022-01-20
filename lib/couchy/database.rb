# frozen_string_literal: true

require "forwardable"

module Couchy
  class Database
    extend Forwardable
    include Resources::Document

    attr_reader :name, :server

    def initialize(name, server)
      @name = name
      @server = server
    end

    def_delegators :server, :exec
  end
end
