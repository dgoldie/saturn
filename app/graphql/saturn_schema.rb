SaturnSchema = GraphQL::Schema.define do
  query(Types::QueryType)
  mutation(Types::MutationType)
  resolve_type ->(obj, ctx) {  }
end
