class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        respond_to do |format|
          flash.now[:danger] = "Symbol not found. Please check entry and try again."
          format.js { render partial: 'users/result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:danger] = "Please enter a stock symbol to search."
        format.js { render partial: 'users/result' }
      end
    end
  end

end
