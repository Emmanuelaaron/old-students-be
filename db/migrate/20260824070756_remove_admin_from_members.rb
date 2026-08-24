class RemoveAdminFromMembers < ActiveRecord::Migration[7.1]
  def change
    remove_column :members, :admin, :boolean, default: false
  end
end
