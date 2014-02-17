class AddEmailAliasesToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :email_aliases, :string
    add_index :admins, :email_aliases
  end
end
