class HomesController < ApplicationController
  def top
    @item =Item.all
  end
end
