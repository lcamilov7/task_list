class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.boolean :done, default: false, null: false
      t.datetime :done_at

      t.timestamps
    end
  end
end
