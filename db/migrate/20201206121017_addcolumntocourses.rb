class Addcolumntocourses < ActiveRecord::Migration[6.0]
  def change
    remove_column :courses, :description
    add_column :courses, :description, :text
  end
end
