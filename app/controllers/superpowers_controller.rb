class SuperpowersController < ApplicationController
  def index
    @superpowers = Superpower.all
  end

  def new
   @superpower = Superpower.new
  end

  def show
   @superpower = Superpower.find(params[:id])
  end

  def create
  @superpower = Superpower.new(superpower_params)

  if @superpower.valid?
    @superpower.save
    redirect_to @superpower
  else
   flash[:error] = @superpower.errors.full_messages
   redirect_to new_superpower_path
  end
  end

  private

  def superpower_params
    params.require(:superpower).permit(:name, :description, :superhero_id)
  end
end
