class DashboardsController < ApplicationController
  def show
    @outlay  = current_user.outlays.build
    @outlays = current_user.outlays.created.includes(:expense_item)
  end
end
