class SuperheroesController < ApplicationController

  def index
    @superheroes = Superhero.all
  end

  def new
    @superhero = Superhero.new
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  def create
    @superhero = Superhero.new(hero_params)
    if @superhero.valid?
      @superhero.save
      redirect_to superhero_path(@superhero)
      flash[:notice] = "You are now a Superhero!"
    else
      render 'new'
    end
  end

  def edit
    @superhero = Superhero.find(params[:id])
  end

  def update
    @superhero.update(hero_params)
    if @superhero.save
      redirect_to superhero_path(@superhero)
    else
      flash[:notice] = "Please try again."
      redirect_to edit_superhero_path(@superhero)
    end
  end

  private

    def hero_params
      params.require(:superhero).permit(:name, :super_name, :superpower_id)
    end

end
