class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
  end

  def show
    @superhero = Superhero.find(params[:id])
    byebug
  end

  def new
    @superhero = Superhero.new

    @superpowers = Superpower.all
  end

  def create
    @superhero = Superhero.new(superhero_params)

    if @superhero.valid?
      @superhero.save
      redirect_to superhero_path(@superhero)
    else
      flash[:errors]
      redirect_to new_superhero_path
    end
  end

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower)
  end

end
