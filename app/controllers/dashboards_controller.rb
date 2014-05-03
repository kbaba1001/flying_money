class DashboardsController < ApplicationController
  def show
    @outlay  = current_user.outlays.build
    @outlay_months = current_user.outlays.created.includes(:expense_item).group_by {|outlay| outlay.created_at.beginning_of_month }
  end
end
