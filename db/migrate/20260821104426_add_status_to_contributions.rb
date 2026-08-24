class AddStatusToContributions < ActiveRecord::Migration[7.1]
  def change
    add_column :contributions, :status, :string, null: false, default: "approved"
    add_index :contributions, :status
  end
end
