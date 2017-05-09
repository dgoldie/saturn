class AddLikedToAttendings < ActiveRecord::Migration[5.0]
  def change
    add_column :attendings, :liked, :boolean, default: true
  end
end
