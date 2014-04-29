class OutlaysController < ApplicationController
  def create
    @outlay = current_user.outlays.build(outlay_params)

    if @outlay.save
      redirect_to root_path
    else
      render 'dashboards/show'
    end
  end

  private

  def outlay_params
    params.require(:outlay).permit(:amount, :note)
  end
end
