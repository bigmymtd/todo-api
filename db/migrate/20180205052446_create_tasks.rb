class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.integer :status
      t.string :name
      t.references :board, foreign_key: true
      t.timestamps
    end
  end
end
