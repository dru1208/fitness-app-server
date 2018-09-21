class CreateUserNutritions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_nutritions do |t|
      t.integer :user_id
      t.float :calories
      t.float :protein
      t.float :fat
      t.float :carbohydrates
      t.float :sugar
      t.datetime :datetime

      t.timestamps
    end
  end
end
