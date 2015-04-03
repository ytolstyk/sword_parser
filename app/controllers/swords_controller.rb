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
      @swords = @swords.where("in_stock == ?", 'In Stock')
    end
    if params[:blunt]
      @swords = @swords.where("edge in (?, ?)", "Blunt", "Unsharpened")
    end
    if params[:sort]
      @swords = @swords.order(params[:sort])
    end
  end
end
