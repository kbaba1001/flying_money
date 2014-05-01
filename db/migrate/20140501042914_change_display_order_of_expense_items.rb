class ChangeDisplayOrderOfExpenseItems < ActiveRecord::Migration
  def change
    add_index :expense_items, :display_order
  end
end
