class RemoveUserFromExpenses < ActiveRecord::Migration[7.0]
  def change
    remove_column :expenses, :user_id, :bigint
  end
end
