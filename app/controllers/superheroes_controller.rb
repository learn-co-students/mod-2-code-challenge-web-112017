class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  def create
    @superhero = Superhero.create(hero_params)
    if @superhero.create
      @superhero.save
      redirect_to superhero_path(@superhero)
    else

    end
  end

  private

  def hero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end
end
