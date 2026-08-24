class CreateNextOfKins < ActiveRecord::Migration[7.1]
  def change
    create_table :next_of_kins do |t|
      t.references :member, null: false, foreign_key: true
      t.string :name
      t.string :telephone
      t.string :email
      t.string :relationship

      t.timestamps
    end
  end
end
