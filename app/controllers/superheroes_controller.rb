class SuperheroesController < ApplicationController
  def index
    if params[:query] != nil #something to know if its a search
      superpower_name = params[:query]
      superpower = Superpower.find_by(name: superpower_name)

      if superpower
        @superheroes = Superhero.where("superpower_id = ?", superpower.id)
      else
        @superheroes = Superhero.all
      end

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

    if @superhero.save
      redirect_to superhero_path(@superhero)
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
