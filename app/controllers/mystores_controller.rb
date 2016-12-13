class MystoresController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Mystore.all.order("created_at DESC")
  end
  def show

  end

  def new
    @item = Mystore.new

  end

  def create
    @item = Mystore.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end

  end

  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to mystore_path(@item)
  else
    render 'edit'
    end
    end
  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:mystore).permit(:title, :description, :price)
  end
  def find_item
    @item = Mystore.find(params[:id])
  end
end
