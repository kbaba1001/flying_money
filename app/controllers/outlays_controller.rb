class OutlaysController < ApplicationController
  def create
    @outlay = current_user.outlays.build(outlay_params)

    if @outlay.save
      redirect_to root_path
    else
      @outlays = current_user.outlays.created.includes(:expense_item)
      render 'dashboards/show'
    end
  end

  private

  def outlay_params
    params.require(:outlay).permit(:expense_item_id, :amount, :note)
  end
end
