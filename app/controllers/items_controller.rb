# frozen_string_literal: true

class ItemsController < ApplicationController
  include Authenticatable
  before_action :set_item, only: [:show, :update, :destroy]
  before_action :authorize_user!, only: [:update, :destroy]

  # GET /items
  def index
    @items = Item.all

    render(json: @items)
  end

  # GET /items/1
  def show
    render(json: @item)
  end

  # POST /items
  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      render(json: @item, status: :created, location: @item)
    else
      render(json: @item.errors, status: :unprocessable_entity)
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render(json: @item)
    else
      render(json: @item.errors, status: :unprocessable_entity)
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  def authorize_user!
    return if current_user == @item.user

    render(json: { error: "You are not authorized to perform this action." }, status: :unauthorized)
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :user_id)
  end
end
