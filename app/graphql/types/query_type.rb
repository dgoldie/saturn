Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :user, Types::UserType do
    description "Returns an user"
    argument :id, !types.ID
    resolve ->(obj, args, ctx) {
      User.find args[:id]
    }
  end
end
