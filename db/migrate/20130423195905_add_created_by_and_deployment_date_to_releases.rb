class AddCreatedByAndDeploymentDateToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :created_by, :string
    add_column :releases, :deployed_at, :datetime

    add_index :releases, :deployed_at
  end
end
