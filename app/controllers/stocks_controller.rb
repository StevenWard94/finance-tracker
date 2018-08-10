class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = "Please enter a stock symbol to search."
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "Symbol not found. Please check entry and try again." unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end

end
