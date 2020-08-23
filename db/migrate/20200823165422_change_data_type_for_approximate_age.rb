class ChangeDataTypeForApproximateAge < ActiveRecord::Migration[5.2]
  def change
    change_column :pets, :approximate_age, :float
  end
end
