class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.string :answer
      t.boolean :is_correct
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
