class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.references :client, null: false, foreign_key: true
      t.string :pj_name
      t.integer :price
      t.date :order_date

      t.timestamps
    end
  end
end
