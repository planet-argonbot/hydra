class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :aasm_state

      t.timestamps
    end
  end
end
