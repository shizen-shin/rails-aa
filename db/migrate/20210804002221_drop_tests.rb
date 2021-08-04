class DropTests < ActiveRecord::Migration[6.1]
  def change
    drop_table :tests do
    end
  end
end
