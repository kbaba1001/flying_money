class OutlaysController < ApplicationController
  def create
    user = User.find(current_user)
    @outlay = user.outlays.build(outlay_params)

    if @outlay.save
      redirect_to root_path
    else
      @outlay_months = user.outlays.group_by_months
      render 'dashboards/show'
    end
  end

  def destroy
    outlay = Outlay.find(params[:id])
    outlay.destroy
    redirect_to root_path
  end

  private

  def outlay_params
    params.require(:outlay).permit(:expense_item_id, :amount, :note)
  end
end
