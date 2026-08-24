class MakePasswordDigestOptionalOnMembers < ActiveRecord::Migration[7.1]
  def change
    change_column_null :members, :password_digest, true
  end
end
