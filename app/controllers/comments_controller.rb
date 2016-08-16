class CommentsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_comment , only: [:destroy]
  before_action :set_place
  before_action :authorize_customer!, only: [:destroy]
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

    @comment.destroy
    redirect_to @place
  end


  private
  def authorize_customer!
    redirect_to @place, notice: "Not authorized" unless @comment.customere_id == current_customer.id
  end
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_place
    @place = Place.find(params[:place_id])
  end
end
