class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @items = Item.all
    @cart_item = @items.all
    #合計金額の初期値は0円
    @total = 0
  end
  
  
 def create
    @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item
      #カートにitemが存在したらamountに新しいCart_itemのamountを足す
      @cart_item.amount += CartItem.new(cart_item_params).amount
    else
      #カートにitemが無ければ新しく作成する
      @cart_item = CartItem.new(cart_item_params)
    end
    #ログインcustomerのみ更新できるようにするため分岐の外に記述する
    @cart_item.customer_id = current_customer.id
    @cart_item.save!
    redirect_to cart_items_path
 end

  
  def update
    @cart_item = current_customer
    @item = Item.all
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy!
    redirect_to cart_items_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end