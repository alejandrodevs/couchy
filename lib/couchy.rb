# frozen_string_literal: true

require "oj"
require "curb"
require "json"
require "sphene"
require "couchy/errors"
require "couchy/version"

module Couchy
  autoload :Server, "couchy/server"
  autoload :Database, "couchy/database"
end
