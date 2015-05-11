class PokemonsController < ApplicationController
  #Pokemon Data is shown here to make sure the Database works
  def index
    @pokemons = Pokemon.all
  end
  #Is there a way for this data to be shown in the Safari Zone?
  def show
    @pokemon = Pokemon.find(params[:id])
  end
  #No new Pokemon are needed to be added
  def new

  end
  #No new Pokemon are needed to be created
  def create

  end
  #Pokemon shouldnt be destroyed in the Database
  def destroy

  end
  private
  #This isn't needed for now. 
  def pokemon_params
    params.require(:pokemon).permit(:name)
  end

end