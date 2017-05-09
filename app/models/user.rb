class User < ApplicationRecord

  has_many :attendings, foreign_key: "viewer_id"

  has_many :broadcast_events, class_name: "Event",
                              foreign_key: "broadcaster_id"

  has_many :attending_events, through: :attendings, source: :event

  validates :email, uniqueness: true

end
