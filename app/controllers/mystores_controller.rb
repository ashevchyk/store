class MystoresController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  def index
    if params[:category].blank?
    @items = Mystore.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @items = Mystore.where(:category_id =>  @category_id).order("created_at desc")
      end
  end
  def show

  end

  def new
   @item = current_user.mystores.build
    @categories = Category.all.map{ |c| [c.name, c.id]}

  end

  def create
    @item = current_user.mystores.build(item_params)
    @item.category_id = params[:category_id]
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end

  end

  def edit
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  def update
    @item.category_id = params[:category_id]
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
    params.require(:mystore).permit(:title, :description, :price, :category_id, :item_img)
  end
  def find_item
    @item = Mystore.find(params[:id])
  end
end
