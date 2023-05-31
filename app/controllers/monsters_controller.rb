# frozen_string_literal: true

class MonstersController < ApplicationController
  include Authenticatable
  before_action :set_monster, only: [:show, :update, :destroy]
  before_action :authorize_user!, only: [:update, :destroy]

  # GET /monsters
  def index
    @monsters = Monster.all

    render(json: @monsters)
  end

  # GET /monsters/1
  def show
    render(json: @monster)
  end

  # POST /monsters
  def create
    @monster = Monster.new(monster_params)
    @monster.user = current_user

    if @monster.save
      render(json: @monster, status: :created)
    else
      render(json: @monster.errors, status: :unprocessable_entity)
    end
  end

  # PATCH/PUT /monsters/1
  def update
    if @monster.update(monster_params)
      render(json: @monster)
    else
      render(json: @monster.errors, status: :unprocessable_entity)
    end
  end

  # DELETE /monsters/1
  def destroy
    @monster.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_monster
    @monster = Monster.find(params[:id])
  end

  def authorize_user!
    return if current_user == @monster.user

    render(json: { error: "You are not authorized to perform this action." }, status: :unauthorized)
  end

  # Only allow a list of trusted parameters through.
  def monster_params
    params.require(:monster).permit(:name)
  end
end
