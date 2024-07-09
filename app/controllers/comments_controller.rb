class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to store_path(@comment.store)
    else
      render :new, status: :unprocessable_entity

    end
  end

  private
  def comment_params
    params.require(:comment).permit(:image, :comment, :remark, :rating_id, :count_id, :charge_id, :hours_id).merge(user_id: current_user.id, store_id: params[:store_id])
  end

end
