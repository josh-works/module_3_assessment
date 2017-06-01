class Api::V1::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    render json: Item.create(item_params), status: 201
  end

  def destroy
    @item = Item.find(params[:id])
    @item.delete
    render :nothing => true, status: 204
  rescue ActiveRecord::RecordNotFound
    render :nothing => true, status: 418
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end

end
