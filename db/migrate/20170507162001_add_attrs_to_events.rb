class AddAttrsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :likes, :integer, default: 0
    add_column :events, :category, :string
  end
end
