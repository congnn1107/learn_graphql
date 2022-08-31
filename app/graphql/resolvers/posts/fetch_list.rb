module Resolvers
  module Posts 
    class FetchList < BaseResolver
      type [::Types::Payloads::PostType], null: true

      def resolve
        Post::all
      end
    end
  end
end