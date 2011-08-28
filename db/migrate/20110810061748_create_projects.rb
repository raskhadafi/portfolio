class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.date :realized_in
      t.string :url
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
