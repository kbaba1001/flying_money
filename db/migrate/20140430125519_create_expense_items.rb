class CreateExpenseItems < ActiveRecord::Migration
  def change
    create_table :expense_items do |t|
      t.string     :name,          null: false
      t.integer    :display_order, null: false
      t.references :user,          null: false, index: true

      t.timestamps
    end
  end
end
