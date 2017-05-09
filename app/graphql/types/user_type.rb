Types::UserType = GraphQL::ObjectType.define do
  name "User"
  description "user"
  # `!` marks a field as "non-null"
  field :id, !types.ID
  field :name, !types.String
  field :email, !types.String
  field :profile, Types::JsonType
end
