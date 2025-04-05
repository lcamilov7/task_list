class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :status, default: 'pending', null: false

      t.timestamps
    end
  end
end
