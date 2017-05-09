Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :createUser, field: Mutations::CreateUserMutation.field
end
