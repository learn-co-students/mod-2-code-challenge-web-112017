class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
  
    if params[:search]
      @superpower = Superpower.find_by(name: params[:search])
      redirect_to superpower_path(@superpower.id)
    end
  end

  def new
    @superhero = Superhero.new
    @superpowers = Superpower.all
  end

  def create
    @superhero = Superhero.new(super_params)
    if @superhero.valid?
      @superhero.save
      redirect_to superhero_path(@superhero)
    else
      flash[:error] = @superhero.errors.full_messages
      redirect_to new_superhero_path
    end
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  private

  def super_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end

end
