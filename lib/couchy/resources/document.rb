# frozen_string_literal: true

module Couchy
  module Resources
    module Document
      def get_document(id)
        exec(:get, "#{name}/#{id}")
      end

      def save_document(id, data = {})
        exec(:put, "#{name}/#{id}", data.to_json)
      end

      def delete_document(id, rev:)
        exec(:delete, "#{name}/#{id}?rev=#{rev}")
      end
    end
  end
end
