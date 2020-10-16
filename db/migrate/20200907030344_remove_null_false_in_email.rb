class RemoveNullFalseInEmail < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :email, :string
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
