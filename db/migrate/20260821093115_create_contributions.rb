class CreateContributions < ActiveRecord::Migration[7.1]
  def change
    create_table :contributions do |t|
      t.references :member, null: false, foreign_key: true
      t.string :month, null: false
      t.integer :amount, null: false
      t.datetime :paid_at, null: false
      t.boolean :has_fine, null: false, default: false
      t.integer :fine_amount, null: false, default: 0
      t.boolean :fine_paid, null: false, default: false

      t.timestamps
    end
    add_index :contributions, [:member_id, :month], unique: true
  end
end
