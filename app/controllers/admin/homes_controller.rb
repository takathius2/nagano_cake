class Admin::HomesController < ApplicationController
  def top
    @items = Item.page(params[:page])
    @genres = Genre.all
  end
end
