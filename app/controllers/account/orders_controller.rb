class Account::OrdersController < ApplicationController
before_action :authenticate_user!

def index
  @orders =current_user.orders.order("id DESC")
end

def apply_to_cancel
@order = Order.find_by_token(params[:id])
OrderMailer.apply_cancel(@order).deliver!
flash[:notice] = "已提交申請"
reidrect_to :back
end

end
