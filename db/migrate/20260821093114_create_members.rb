class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :occupation, null: false
      t.date :date_of_birth, null: false
      t.string :tel, null: false
      t.text :address, null: false
      t.string :gender, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.boolean :approved, null: false, default: false
      t.boolean :admin, null: false, default: false
      t.string :api_token
      t.datetime :joined_at, null: false

      t.timestamps
    end
    add_index :members, :email, unique: true
    add_index :members, :api_token, unique: true
  end
end
