class CreateExerciseSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :exercise_sessions do |t|
      t.integer :minutes
      t.datetime :datetime
      t.integer :user_id
      t.date :week_of
      t.timestamps
    end
  end
end
