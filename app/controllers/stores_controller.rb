class StoresController < ApplicationController

  def index
    @all_stores = Store.find_by_zip(params[:Search])
    @stores = @all_stores[0..9]
  end

end
