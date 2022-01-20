# frozen_string_literal: true

module Couchy
  module Resources
    module Database
      def get_database(name)
        exec(:get, name)
      end

      def create_database(name, data = {})
        exec(:put, name, data.to_json)
      end

      def delete_database(name)
        exec(:delete, name)
      end
    end
  end
end
