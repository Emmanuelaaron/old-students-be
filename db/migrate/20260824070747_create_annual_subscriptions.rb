class CreateAnnualSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :annual_subscriptions do |t|
      t.references :member, null: false, foreign_key: true
      t.integer :year, null: false
      t.integer :amount, null: false, default: 50_000
      t.datetime :paid_at, null: false
      t.string :status, null: false, default: "approved"

      t.timestamps
    end

    add_index :annual_subscriptions, [:member_id, :year], unique: true
  end
end
