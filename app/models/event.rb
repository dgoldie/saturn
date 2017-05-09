class Event < ApplicationRecord
  belongs_to :broadcaster, class_name: "User"

  has_many :attendings, dependent: :destroy
  has_many :viewers, through: :attending

  validates :category, inclusion: { in: %w(rock country hip-hop folk indie electronic pop comedy latin classical)}

  def update_likes!
    self.likes = attendings.where("liked = 't'").count
    save!
  end
end
