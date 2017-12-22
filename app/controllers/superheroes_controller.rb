class SuperheroesController < ApplicationController

  def index
    @superheroes = Superhero.search(params[:q])
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  def new
    @superhero = Superhero.new
    @superpowers = Superpower.all
  end

  def create
    @superhero = Superhero.new(superhero_params)
    if @superhero.save
      redirect_to @superhero
    else
      flash[:errors] = @superhero.errors.full_messages
      redirect_to new_superhero_path
    end
  end

  private

    def superhero_params
      params.require(:superhero).permit(:name, :super_name, :superpower_id)
    end

end
