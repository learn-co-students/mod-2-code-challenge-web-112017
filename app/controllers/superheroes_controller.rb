class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
    if params[:search]
    @superpower = Superpower.search(params[:search]).order("created_at DESC")
  else
    @superpower = Superpower.all.order("created_at DESC")
  end
  end

  def new
   @superhero = Superhero.new
   @superpowers = Superpower.all
  end

  def show
   @superhero = Superhero.find(params[:id])
   @superpowers = Superpower.all
  end

  def create
  @superhero = Superhero.new(superhero_params)

  if @superhero.valid?
    @superhero.save
    redirect_to @superhero
  else
   flash[:error] = @superhero.errors.full_messages
   redirect_to new_superhero_path
  end
  end

  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end
end
