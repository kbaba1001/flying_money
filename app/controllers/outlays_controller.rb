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

  def index
    user = User.find(current_user)
    @outlays = user.outlays.monthly(parse_params_date).decorate
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

  def parse_params_date
    Date.new(params[:year].to_i, params[:month].to_i)
  end
end
