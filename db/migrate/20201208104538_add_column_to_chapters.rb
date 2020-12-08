class AddColumnToChapters < ActiveRecord::Migration[6.0]
  def change
    add_column :chapters, :is_completed, :boolean, default: false
  end
end
