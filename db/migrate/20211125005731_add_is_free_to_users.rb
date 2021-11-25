class AddIsFreeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_free, :boolean, default: true
  end
end
