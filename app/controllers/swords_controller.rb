class SwordsController < ApplicationController
  def index
    @swords = Sword.all.order(:price)
    if params[:price] && params[:price].length > 0
      @swords = @swords.where("price <= ?", params[:price])
    end

    if params[:length] && params[:length].length > 0
       @swords = @swords.where("total_length >= ?", params[:length])
    end

    if params[:grip] && params[:grip].length > 0
      @swords = @swords.where("hilt_length >= ?", params[:grip])
    end

    if params[:instock]
      @swords = @swords.where("lower(in_stock) == ?", 'in stock')
    end

    if params[:blunt]
      @swords = @swords.where("lower(edge) in (?, ?)", "blunt", "unsharpened")
    end
    
    if params[:sort]
      @swords = @swords.order(params[:sort])
    end
  end
end
