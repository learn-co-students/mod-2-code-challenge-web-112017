class SuperpowersController < ApplicationController

  def show
    @superpower = Superpower.find(params[:id])
  end

  def new
    @superpower = Superpower.new
  end

  def create
    @superpower = Superpower.new
  end

  def index
    @superpowers = Superpower.all
  end

  def superpower_params
    params.require(:superpower).permit(:name)
  end
end
