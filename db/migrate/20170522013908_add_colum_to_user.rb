class AddColumToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :authentication_token, :integer, unique: true
  end
end
