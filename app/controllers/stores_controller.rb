class StoresController < ApplicationController
  before_action :set_store, except: [:index, :new, :create]

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
  end

  def edit
  end
  
  def update
    if @store.update(store_params)
      redirect_to store_path(@store)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @store.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

def store_params
  params.require(:store).permit(:image, :store, :product_description, :cooking_name, :lunch_id, :dinner_id, :phone, :city, :block, :building, :regular_day, :category_id, :prefecture_id).merge(user_id: current_user.id)
end

end
