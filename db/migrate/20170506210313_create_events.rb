class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :broadcaster_id
      t.string :title
      t.boolean :live_now, null: false, default: false
      t.datetime :start,   null: false
      t.datetime :end,     null: false

      t.timestamps
    end
  end
end
