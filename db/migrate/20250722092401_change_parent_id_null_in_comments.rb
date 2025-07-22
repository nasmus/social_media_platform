class ChangeParentIdNullInComments < ActiveRecord::Migration[8.0]
  def up
    add_column :comments, :new_parent_id, :integer, null: true
    execute "UPDATE comments SET new_parent_id = parent_id"
    remove_column :comments, :parent_id
    rename_column :comments, :new_parent_id, :parent_id
    add_index :comments, :parent_id
  end

  def down
    change_column_null :comments, :parent_id, false
  end
end
