class CommentsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_place

  def create
    @comment = @place.comments.new(body: params[:comment][:body], customer_id: current_customer.id, place_id: @place.id)
    if @comment.save
      redirect_to @place
    else
      redirect_to @place, notice: 'Comment is not valid'
    end
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @place
  end


  private

  def set_place
    @place = Place.find(params[:place_id])
  end
end
