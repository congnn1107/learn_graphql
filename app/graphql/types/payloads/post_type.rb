# frozen_string_literal: true

module Types
  module Payloads
    class PostType < Types::BaseObject
      graphql_name "PostType"

      field :id, ID
      field :title, String, null: true
      field :content, String, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: true
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
    end
  end
end
