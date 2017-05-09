class Message < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create do
    Pusher.trigger("event-#{event.id}", "message_created", message: self.as_json(include: [:user, :event]))
  end
end
