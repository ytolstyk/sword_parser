class SwordsController < ApplicationController
  def index
    @swords = Sword.all.page(params[:page]).per(15)
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
      @swords = @swords.where("lower(edge) in (?, ?)", "blunt", "unsharpened", "rebated")
    end

    @swords = @swords.order(sort_column + ' ' + sort_direction)
  end

  private

  def sort_column
    Sword.column_names.include?(params[:sort]) ? params[:sort] : "price"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
