class AddReleasesCountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :releases_count, :integer
    add_index :projects, :releases_count
  end
end
