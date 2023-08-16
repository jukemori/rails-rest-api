class Api::V1::ActorsController < ApplicationController
  def index
    render json: Actor.all
  end

  def show
    render json: Actor.find(params[:id])
  end

  def create
    actor = Actor.new(actor_params)
    if actor.save
      render json: actor
    else
      render json: actor.erros, status: 422
    end
  end

  def update
    actor = Actor.find(params[:id])
    if actor.update(actor_params)
      render json: actor
    else
      render json: actor.errors, status: 422
    end
  end

  def destroy
    actor = Actor.find(params[:id])
    actor.destroy
    render json: actor
  end

  private
    def actor_params
      params.require(:actor).permit(:name, :country)
    end
end
