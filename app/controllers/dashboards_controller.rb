class DashboardsController < ApplicationController
  def show
    @outlay        = current_user.outlays.build
  end
end
