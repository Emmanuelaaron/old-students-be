class AddRoleToMembers < ActiveRecord::Migration[7.1]
  def up
    add_column :members, :role, :integer, null: false, default: 0
    Member.reset_column_information
    Member.where(admin: true).find_each do |m|
      m.update_column(:role, Member.roles[:chairperson])
    end
  end

  def down
    remove_column :members, :role
  end
end
