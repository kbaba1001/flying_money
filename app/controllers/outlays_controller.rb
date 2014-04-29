class OutlaysController < ApplicationController
  def create
    @outlay = Outlay.create(outlay_params)
    @outlay.save

    @outlays = Outlay.all

    redirect_to dashboard_path
  end

  private

  def outlay_params
    params.require(:outlay).permit(:amount, :note)
  end
end
