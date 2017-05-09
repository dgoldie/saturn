Mutations::CreateUserMutation = GraphQL::Relay::Mutation.define do
  name "CreateUser"
  # TODO: define return fields
  # return_field :post, Types::PostType

  # TODO: define arguments
  input_field :name, !types.String
  input_field :email, !types.String
  input_field :profile, !Types::JsonType

  return_field :user, Types::UserType
  return_interfaces [Types::MutationResultInterfaceType]

  resolve ->(obj, args, ctx) {
    # TODO: define resolve function
    user = User.new name: args[:name], email: args[:email], profile: args[:profile]
    success = user.save
    {
      user: user,
      success: success,
      errors: user.errors.map { |f, m| {field: f, message: m} }
    }
  }
end
