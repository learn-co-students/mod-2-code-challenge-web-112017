class SuperheroesController < ApplicationController
  def index
    if params[:superpower]
      @superheroes = Superhero.select {|hero| hero.superpower.name.downcase.include?(params[:superpower].downcase)}
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
