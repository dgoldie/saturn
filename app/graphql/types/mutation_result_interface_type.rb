Types::MutationResultInterfaceType = GraphQL::InterfaceType.define do
  name "MutationResultInterface"

  field :success, !types.Boolean
  field :errors, types[Types::ValidationErrorType]
end
