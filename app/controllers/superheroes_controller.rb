class SuperheroesController < ApplicationController

  def show
    @superhero = Superhero.find(params[:id])
  end

  def new
    @superhero = Superhero.new
    @superpowers = Superpower.all
  end

  def create
    @superhero = Superhero.new(superhero_params)
    byebug
    if @superhero.save
      redirect_to @superhero
    else
      redirect_to new_superhero_path
    end
  end

  def index
    @superheroes = Superhero.all
    if params[:search]
      @superheroes = Superhero.search(params[:search]).order("created_at DESC")
    else
      @superheroes = Superhero.all.order('created_at DESC')
    end
  end

  def destroy

  end

  def update

  end

  def edit

  end

  private
  def superhero_params
    params.require(:superhero).permit(:super_name, :name, superpowers_attributes: [:id] )
  end
end
