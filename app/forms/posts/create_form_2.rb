module Posts
  class CreateForm2 < ActiveType::Object
    attribute :title, :string
    attribute :content, :string

    validates :title, presence: true, length: { minimum: 2 }

    def save
      post = Post.new(title: title, content: content)
      post.save
      post
    end
  end
end
