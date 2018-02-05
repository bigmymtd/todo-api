class CreateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.string :name
      t.integer :prev_id

      t.timestamps
    end
  end
end
