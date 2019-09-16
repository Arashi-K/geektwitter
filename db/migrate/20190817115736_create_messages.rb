class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|

      t.integer :room_id
      t.text :content
      t.boolean :checked, null: false, default: false
      t.timestamps
    end
  end
end
