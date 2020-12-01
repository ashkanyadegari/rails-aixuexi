class CreateOngoingCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :ongoing_courses do |t|
      t.boolean :is_completed
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
