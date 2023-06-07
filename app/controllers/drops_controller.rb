# frozen_string_literal: true

class DropsController < ApplicationController
  include Authenticatable
  before_action :set_drop, only: [:show, :update, :destroy]

  # GET /drops
  def index
    @drops = Drop.all

    render(json: @drops)
  end

  # GET /drops/1
  def show
    render(json: @drop)
  end

  # POST /drops
  def create
    @drop = Drop.new(drop_params)

    if @drop.save
      render(json: @drop, status: :created, location: @drop)
    else
      render(json: @drop.errors, status: :unprocessable_entity)
    end
  end

  # PATCH/PUT /drops/1
  def update
    if @drop.update(drop_params)
      render(json: @drop)
    else
      render(json: @drop.errors, status: :unprocessable_entity)
    end
  end

  # DELETE /drops/1
  def destroy
    @drop.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_drop
    @drop = Drop.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def drop_params
    params.require(:drop).permit(:item_id, :creature_id)
  end
end
