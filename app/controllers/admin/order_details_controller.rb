class Admin::OrderDetailsController < ApplicationController
    
private
def order_detail_params
    params.require(:oder_detail).permit(:item_id, :order_id, :price, :puroduct_atatus, :amount)
end

end
