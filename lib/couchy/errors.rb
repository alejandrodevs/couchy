# frozen_string_literal: true

module Couchy
  class Error < StandardError; end
  class ServerError < Error; end
  class ResouceNotFound < Error; end
end
