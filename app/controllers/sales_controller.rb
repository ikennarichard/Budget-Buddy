class SalesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource except: :create

  def new
    @sale = Sale.new
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
  end

  def create
    @sale = current_user.sales.build(sales_params)
    @group = Group.find(sales_params['group_id'])

    if @sale.save!
      redirect_to group_path(@group), notice: 'Transaction was added successfully'
    else
      render :new, notice: 'Failed to add transaction'
    end
  end

  private

  def sales_params
    params.require(:sale).permit(:name, :amount, :group_id)
  end
end
