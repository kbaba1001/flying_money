class DashboardsController < ApplicationController
  def show
    @outlay        = current_user.outlays.build
    @outlay_months = current_user.outlays.group_by_months
  end
end
