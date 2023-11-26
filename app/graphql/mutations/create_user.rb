class Mutations::CreateUser < Mutations::BaseMutation
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :address, String, required: true
  argument :postcode, String, required: true
  argument :city, String, required: true
  argument :country, String, required: true

  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(first_name:, last_name:, address:, postcode:, city:, country:)
    user = User.new(first_name: first_name, last_name: last_name, address: address, postcode: postcode, city: city, country: country)
    if (user.save)
      {
        user: user,
        errors: []
      }
    else
      {
        user: nil,
        errors: user.errors.full_messages
      }
    end
  end
end
