class SuperheroesController < ApplicationController
  def index
    if params[:q]
      @superpower = Superpower.find_by(name: params[:q].downcase)
      @superheroes = Superhero.find_by(@superpower.id)
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
    @superhero = Superhero.new(superhero_params)
    if @superhero.valid?
      @superhero.save
      redirect_to superhero_path(@superhero.id)
    else
      flash[:errors] = @superhero.errors.full_messages
      @superhero = Superhero.new
      @superpowers = Superpower.all
      redirect_to new_superhero_path
    end
  end

  private

  def superhero_params
      params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end

end
