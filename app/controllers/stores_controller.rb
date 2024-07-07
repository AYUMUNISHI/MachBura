class StoresController < ApplicationController
  def index
    @store = Store.new
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

  end 

  def show
    @store = Store.find(params[:id])
  end

  private

def store_params
  params.require(:store).permit(:image, :store, :product_description, :cooking_name, :lunch_id, :dinner_id, :phone, :city, :block, :building, :regular_day, :category_id, :prefecture_id).merge(user_id: current_user.id)
end

end
