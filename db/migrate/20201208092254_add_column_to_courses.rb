class AddColumnToCourses < ActiveRecord::Migration[6.0]
  def change
    add_reference :courses, :chapter, foreign_key: true
  end
end
