class AddDefaultToTodoStatus < ActiveRecord::Migration[6.1]
  def change
    change_column_default :todos, :status, 0
  end
end
