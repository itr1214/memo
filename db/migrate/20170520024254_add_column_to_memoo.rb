class AddColumnToMemoo < ActiveRecord::Migration[5.1]
  def change
    add_column :memoos, :user_id, :Integer
  end
end