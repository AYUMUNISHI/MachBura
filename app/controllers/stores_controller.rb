class StoresController < ApplicationController
  before_action :set_store, except: [:index, :new, :create]
  before_action :move_to_signed_in, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]


  def index
    @store = Store.new
    @stores = Store.includes(:user, :comments)
    @comment = Comment.new
    @comments = @store.comments.includes(:user)
   
   
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
    @comment = Comment.new
    @comments = @store.comments.includes(:user)
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
  params.require(:store).permit( :store, :product_description, :description, :cooking_name, :lunch_id, :dinner_id, :phone, :city, :block, :building, :regular_day, :category_id, :prefecture_id, {images: []}).merge(user_id: current_user.id)
end

def move_to_signed_in
  unless user_signed_in?
    #サインインしていないユーザーはログインページが表示される
    redirect_to  '/users/sign_in'
  end
end

def contributor_confirmation
  redirect_to root_path unless current_user == @store.user 
end
end
