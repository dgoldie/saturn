Types::ValidationErrorType = GraphQL::ObjectType.define do
  name "ValidationError"

  field :field, !types.String do
    resolve ->(obj, args, ctx) {
      obj[:field].to_s.camelize :lower
    }
  end

  field :message, !types.String do
    resolve ->(obj, args, ctx) {
      obj[:message]
    }
  end
end
