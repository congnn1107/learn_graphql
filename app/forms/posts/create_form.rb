module Posts
  class CreateForm < BaseForm
    MIN_TITLE_LENGTH = 5
    attr_accessor :title, :content
    validates :title, presence: true, length: { minimum: MIN_TITLE_LENGTH }

    def initialize(attributes = {})
      @title = attributes[:title]
      @content = attributes[:content]
    end

    def create
      post = Post.new(title: @title, content: @content)
      post.save
      post
    end
  end
end
