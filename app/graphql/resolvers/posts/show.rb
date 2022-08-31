module Resolvers
  module Posts
    class Show < BaseResolver
      argument :id, ID, required: true

      type ::Types::Payloads::PostType, null: true

      def resolve(id: )
        Post.find(id)
      end
    end
  end
end