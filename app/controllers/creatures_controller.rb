# frozen_string_literal: true

class CreaturesController < ApplicationController
  include Authenticatable
  before_action :set_creature, only: [:show, :update, :destroy]
  before_action :authorize_user!, only: [:update, :destroy]

  # GET /creatures
  def index
    @creatures = Creature.all

    render(json: @creatures)
  end

  # GET /creatures/1
  def show
    render(json: @creature)
  end

  # POST /creatures
  def create
    @creature = Creature.new(creature_params)
    @creature.user = current_user

    if @creature.save
      render(json: @creature, status: :created)
    else
      render(json: @creature.errors, status: :unprocessable_entity)
    end
  end

  # PATCH/PUT /creatures/1
  def update
    if @creature.update(creature_params)
      render(json: @creature)
    else
      render(json: @creature.errors, status: :unprocessable_entity)
    end
  end

  # DELETE /creatures/1
  def destroy
    @creature.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_creature
    @creature = Creature.find(params[:id])
  end

  def authorize_user!
    return if current_user == @creature.user

    render(json: { error: "You are not authorized to perform this action." }, status: :unauthorized)
  end

  # Only allow a list of trusted parameters through.
  def creature_params
    params.require(:creature).permit(:name)
  end
end
