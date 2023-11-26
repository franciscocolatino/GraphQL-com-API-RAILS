class Mutations::CreatePost < Mutations::BaseMutation
  argument :user_id, ID, required: true
  argument :body, String, required: true

  field :post, Types::PostType, null: false
  field :errors, [String], null: false

  def resolve(user_id:, body:)
    post = Post.new(user_id: user_id, body: body)
    if (post.save)
      {
        post: post,
        errors: []
      }
    else
      {
        post: nil,
        errors: post.errors.full_messages
      }
    end
  end
end
