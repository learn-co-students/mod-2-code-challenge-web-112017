class SuperheroesController < ApplicationController


  def index
    @superheroes = Superhero.all

    #if there is a there is a field that is filled in with a superpower
    #create new @variable that only includes those superheroes with that supwerpower
    #present taht instead, in the htmml
    #@superheroes = Superhero.all

  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  def new
    @superpowers = Superpower.all
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.new(superhero_params)

    if @superhero.valid?
      @superhero.save
      redirect_to superhero_path(@superhero)
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
