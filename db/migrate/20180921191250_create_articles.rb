class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :link
      t.datetime :datetime
      t.integer :user_id

      t.timestamps
    end
  end
end
