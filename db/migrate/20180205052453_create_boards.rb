class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.string :board_name
      t.string :task_list

      t.timestamps
    end
  end
end
