class CreateMemoos < ActiveRecord::Migration[5.1]
  def change
    create_table :memoos do |t|
      t.text :text
      t.timestamps
    end
  end
end
