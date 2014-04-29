class OutlaysController < ApplicationController
  def create
    @outlay = Outlay.new(outlay_params)

    if @outlay.save
      redirect_to dashboard_path
    else
      @outlays = Outlay.all
      render 'dashboards/show'
    end
  end

  private

  def outlay_params
    params.require(:outlay).permit(:amount, :note)
  end
end
