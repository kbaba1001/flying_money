class OutlaysController < ApplicationController
  permits :expense_item_id, :amount, :note

  layout false, only: :index

  def create(outlay)
    user = User.find(current_user)
    @outlay = user.outlays.build(outlay)

    if @outlay.save
      redirect_to root_path
    else
      @outlay_months = user.outlays.group_by_months
      render 'dashboards/show'
    end
  end

  def index
    redirect_to root_path unless request.xhr?

    user = User.find(current_user)
    @outlays = user.outlays.monthly(parse_params_date).decorate
    @outlay_sums_by_expense_item = @outlays.each_with_object({}) {|ol, hash|
      name = ol.expense_item.name
      hash[name] = hash[name].to_i + ol.amount
    }
  end

  def destroy(id)
    outlay = Outlay.find(id)
    outlay.destroy
    redirect_to root_path
  end

  private

  def parse_params_date
    Date.new(params[:year].to_i, params[:month].to_i)
  end
end
