Types::JsonType = GraphQL::ScalarType.define do
  name "Json"
  description "JSON scalar type"

  coerce_input ->(value) { JSON.parse(value) }
  coerce_result ->(value) { value }
end
