class CreateLoginOtps < ActiveRecord::Migration[7.1]
  def change
    create_table :login_otps do |t|
      t.references :member, null: false, foreign_key: true
      t.string :code_digest
      t.datetime :expires_at
      t.datetime :consumed_at

      t.timestamps
    end
  end
end
