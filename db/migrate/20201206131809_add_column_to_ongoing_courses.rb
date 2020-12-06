class AddColumnToOngoingCourses < ActiveRecord::Migration[6.0]
  def change
    remove_column :ongoing_courses, :is_completed
    add_column :ongoing_courses, :is_completed, :boolean, default: false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
