class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.text :description, null: false
      t.integer :status
      t.references :list
      t.timestamps
    end
    add_index :todos, [:description, :list_id], unique: true
  end
end
