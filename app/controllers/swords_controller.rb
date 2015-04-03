class SwordsController < ApplicationController
  def index
    @swords = Sword.all
    if params[:price]
      @swords = @swords.where("price =< #{params[:price]}")
    end
    if params[:length]
      @swords = @swords.where("total_length >= #{params[:total_length]}")
    end
    @swords = @swords.where("in_stock == 'In Stock'")
  end
end
