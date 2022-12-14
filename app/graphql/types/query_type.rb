module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    # field :posts, [Types::Payloads::PostType]

    # def posts
    #   Post::all
    # end

    field :posts, resolver: Resolvers::Posts::FetchList
    field :post, resolver: Resolvers::Posts::Show
    
  end
end
