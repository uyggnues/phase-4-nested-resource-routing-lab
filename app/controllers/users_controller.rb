class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  def show
    user = User.find_by(id: params[:id])
    render json: user, include: :items
  end
 
  def index
    user = User.find(params[:user_id])
    items = user.items
    render json: items, include: :user
  end

  def item
    user = User.find(params[:user_id])
    items = user.items
    item = items.find(params[:id])
    render json: item
  end

  def create
    item = Item.create(items_params)
    render json: item, status: :created
  end


  private
  def items_params
    params.permit(:name, :description, :price, :user_id)
  end

  def render_not_found_response
    render json: { error: "not found" }, status: :not_found
  end
end
