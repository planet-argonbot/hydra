class AddEmailAliasesToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :email_alias, :string
    add_index :admins, :email_alias
  end
end
