class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.references :project
      t.references :admin
      t.string :branch
      t.string :environment

      t.timestamps
    end

    add_index :releases, :project_id
    add_index :releases, :admin_id
  end
end
