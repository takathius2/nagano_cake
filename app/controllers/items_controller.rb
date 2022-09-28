class ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def item_params
    params.require(:item).permit(
     :name, :item_image, :introduction, :item_price, :genre_id)
  end
end
