class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :pj_name
      t.string :client_name
      t.integer :status
      t.date :order_date
      t.bigint :price
      t.text :memo

      t.timestamps
    end
  end
end
