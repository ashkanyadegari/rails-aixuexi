class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :open_id
      t.string :avatar
      t.references :company, foreign_key: true
      t.integer :user_points

      t.timestamps
    end
  end
end
