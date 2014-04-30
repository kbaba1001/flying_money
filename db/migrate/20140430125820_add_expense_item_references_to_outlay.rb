class AddExpenseItemReferencesToOutlay < ActiveRecord::Migration
  def change
    add_reference :outlays, :expense_item, null: false, index: true
  end
end
