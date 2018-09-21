class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.datetime :datetime
      t.integer :user_id

      t.timestamps
    end
  end
end
