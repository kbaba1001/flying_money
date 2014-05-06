class ExpenseItemsController < ApplicationController
  def index
    @expense_item = current_user.expense_items.build
    @expense_item.set_default_display_order!

    @expense_items = current_user.expense_items.ordered
  end

  def create
    @expense_item = current_user.expense_items.build(expense_item_params)

    if @expense_item.save
      redirect_to expense_items_path
    else
      @expense_items = current_user.expense_items.ordered
      render :index
    end
  end

  def destroy
    expense_item = ExpenseItem.find(params[:id])
    expense_item.destroy
    redirect_to expense_items_path
  end

  private

  def expense_item_params
    params.require(:expense_item).permit(:name, :display_order)
  end
end
