class CreateFitnessGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :fitness_goals do |t|
      t.string :description
      t.boolean :completed
      t.datetime :datetime
      t.integer :user_id

      t.timestamps
    end
  end
end
