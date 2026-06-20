class PokemonsController < ApplicationController
  # before_action :pokemons, only: [:show, :edit, :update, :destroy]

  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
