class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
    # if params[:search]
    #   @superheroes = Superhero.search(params[:search]).order("created_at DESC")
    # else
    #   @superheroes = Superhero.all.order('created_at DESC')
    # end
  end

  def new
    @superhero = Superhero.new
    @superpowers = Superpower.all
  end

  def show
    @superhero = Superhero.find(params[:id])
  end
end
