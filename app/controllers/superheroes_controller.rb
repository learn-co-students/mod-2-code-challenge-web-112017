class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
  end

  def show
    @superhero = Superhero.find(params[:id])
    @superpower = params[:q]
  end

  # def searchpower
  #   @superheroes = Superhero.all
  #   @superpower = params[:q]
  # end

  def new
    @superhero = Superhero.new
    @superpowers = Superpower.all
  end

  def create
    byebug
    @superhero = Superhero.new(superhero_params) #private method for strong params
    if @superhero.valid?
      @superhero.save #add validations later #check all inputs are there
      redirect_to superhero_path(@superhero)
    else
      flash[:error] = @superhero.errors.full_messages
      redirect_to new_superhero_path(@superhero)
    end
  end

  private

    def superhero_params
      params.require(:superhero).permit(:name, :super_name, :superpower_id)
    end
end
