module Types
  module Arguments
    class PostInputType < ::Types::BaseInputObject
      argument :title, String, required: false
      argument :content, String, required: false
    end
  end
end