# frozen_string_literal: true

module Mutations
  class PostCreate < BaseMutation
    description "Creates a new post"

    field :post, Types::Payloads::PostType

    argument :input, Types::Arguments::PostInputType, required: false

    def resolve(input:)
      # post = ::Post.new(**input)
      # raise GraphQL::ExecutionError.new "Error creating post", extensions: post.errors.to_hash unless post.save

      # { post: post }
      # form = ::Posts::CreateForm.new(input)
      form = ::Posts::CreateForm2.new(input.to_h)
      if form.valid?
        # { post: form.create }
        {post: form.save}
      else
        raise GraphQL::ExecutionError.new "Error creating post", extensions: form.errors.messages
      end
      
    end
  end
end
