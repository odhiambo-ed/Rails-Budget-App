class RemoveUserIdFromExpenses < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :expenses, column: :user_id
  end
end
