class DashboardsController < ApplicationController
  def show
    @outlay = Outlay.new
    @outlays = Outlay.all
  end
end
