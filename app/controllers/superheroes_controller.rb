class SuperheroesController < ApplicationController
  def index
    @superpowers = Superpower.all

    if params[:power]
      @superheroes = Superhero.all.select { |hero| hero.superpower.name == params[:power]}
    else
      @superheroes = Superhero.all
    end
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  def new
    @superhero = Superhero.new
    @superpowers = Superpower.all
  end

  def create
    @superhero = Superhero.new(hero_params)

    if @superhero.save
      redirect_to superhero_path(@superhero)
    else
      redirect_to new_superhero_path
    end
  end

  private

  def hero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end

end
