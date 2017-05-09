class Attending < ApplicationRecord

  belongs_to :viewer, class_name: "User"
  belongs_to :event

  # validates_uniqueness_of :viewer_id, :scope => :event_id
  after_save do
    if liked != liked_was
      event.update_likes!
    end
  end
end
