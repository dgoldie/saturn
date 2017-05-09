EventType = GraphQL::ObjectType.define do
  name "Event"
  description "events"
  # `!` marks a field as "non-null"
  field :id, !types.ID
  field :title, !types.String
  # broadcaster_id
  field :live_now, !types.Boolean
end
