class PokeballsController < ApplicationController
  def create
    @pokeball = Pokeball.new(pokeball_params)
    if @pokeball.save
      redirect_to trainer_path(@pokeball.trainer)
    else
      @pokemon = @pokeball.pokemon
      @trainers = Trainer.all
      render "pokemons/show", status: :unprocessable_entity # ← @pokeball survives to the view
    end
  end

  private

  def pokeball_params
    params.require(:pokeball).permit(:trainer_id, :pokemon_id, :location, :caught_on)
  end
end
