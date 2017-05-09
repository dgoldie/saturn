class CreateAttendings < ActiveRecord::Migration[5.0]
  def change
    create_table :attendings do |t|
      t.integer :viewer_id, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
