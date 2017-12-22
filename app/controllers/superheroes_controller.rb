class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
    if params[:search]
      @superheroes = Superhero.search(params[:search])
    else
      @superheroes = Superhero.all
    end
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
      flash[:error] = @superhero.errors.full_messages
      redirect_to new_superhero_path
    end
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  #According to the instructions there is no edit or delete feature for superheroes
  # def edit
  #   @superhero = Superhero.find(params[:id])
  # end
  #
  # def update
  #   @superhero = Superhero.find(params[:id])
  #   if @superhero.update(superhero_params)
  #     redirect_to superhero_path(@superhero)
  #   else
  #     flash[:error] = @superhero.errors.full_messages
  #     redirect_to edit_superhero_path
  #   end
  #
  # end

  # def delete
  #   @superhero = Superhero.find(params[:id])
  #   @superhero.destory
  #   redirect_to superheroes_path
  # end

  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end
end
