class AddStatusToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :status, :boolean, default: true
  end
end
