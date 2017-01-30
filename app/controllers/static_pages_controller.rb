class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @items = Item.all
    end
  end

  def about
  end
end
