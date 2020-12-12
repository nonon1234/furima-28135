class AddSoldToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :sold, :boolean, default: false, null: false
  end
end
