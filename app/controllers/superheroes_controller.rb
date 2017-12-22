class SuperheroesController < ApplicationController

  def index
      @search = Superhero.new(params[:superhero])
    # if @search
    #   @superheroes = Superhero.find_by_name(@search.name)
    # else
      @superheroes = Superhero.all
  end
    # @search = Animal.new(params[:animal])
    # @animals = Animal.by_color(@search.color)

  def new
    @superhero = Superhero.new
    @superpowers = Superpower.all
  end

  def create
    @superhero = Superhero.create(superhero_params)
    if @superhero.valid?
      @superhero.save
      redirect_to superhero_path(@superhero)
    else
      flash[:error] = @superhero.errors.full_messages  #flash[:error] is an array of individual ‘error’ messages)
      redirect_to new_superhero_path
    end
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id, :term)
  end

end
