class SuperheroesController < ApplicationController

  def show
    @superhero = Superhero.find(params[:id])
  end

  def new
    @superhero = Superhero.new
    @superpowers = Superpower.all
  end

  def create
    byebug
    @superhero = Superhero.new(superhero_params)
    if @superhero.save
      redirect_to @superhero
    else
      flash[:errors] = @superhero.errors.full_messages
      redirect_to new_superhero_path
    end
  end

  def index
    @superheroes = Superhero.all
    if params[:search]
      @superheroes = Superhero.search(params[:search]).order("created_at DESC")
    else
      @superheroes = Superhero.all.order('created_at DESC')
    end

  end

  def destroy

  end

  def update

  end

  def edit

  end

  private
  def superhero_params
    params.require(:superhero).permit(:super_name, :name, :superpower_id )
  end
end
