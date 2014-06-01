class ExpenseItemsController < ApplicationController
  permits :name, :display_order

  def index
    @expense_item = current_user.expense_items.build
    @expense_item.set_default_display_order!

    @expense_items = current_user.expense_items.ordered
  end

  def create(expense_item)
    user = User.find(current_user)
    @expense_item = user.expense_items.build(expense_item)

    if @expense_item.save
      redirect_to expense_items_path
    else
      @expense_items = user.expense_items.ordered
      render :index
    end
  end

  def destroy(id)
    expense_item = ExpenseItem.find(id)
    expense_item.destroy
    redirect_to expense_items_path
  end
end
