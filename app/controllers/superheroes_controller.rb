class SuperheroesController < ApplicationController

  def index
    @superheroes = Superhero.all
    @superpowers = Superpower.search(params[:search])
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  def new
    @superhero = Superhero.new
    @superpowers = Superpower.all
  end

  def create
    byebug
    @superhero = Superhero.new(superhero_params)

    if @superhero.valid?
      @superhero.save
      redirect_to superhero_path(@superhero)
    else
      flash[:error] = @superhero.errors.full_messages
      redirect_to new_superhero
    end
  end


  private

  def superhero_params
    params.require(:superhero).permit(:super_name, :name)
  end

end
