class CreateRoleHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :role_histories do |t|
      t.references :member, null: false, foreign_key: true
      t.string :role, null: false
      t.datetime :started_at, null: false
      t.datetime :ended_at
      t.references :appointed_by, null: false, foreign_key: { to_table: :members }

      t.timestamps
    end
  end
end
