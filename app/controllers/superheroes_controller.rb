class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
    if params[:search]
      @superheroes = Superhero.search(params[:search])
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
      redirect_to @superhero
    else
      flash[:error] = @superhero.errors.full_messages
      render :new
    end
  end

private

def superhero_params
  params.require(:superhero).permit(:name, :super_name, :superpower_id)
end



end
