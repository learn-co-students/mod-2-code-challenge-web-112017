class SuperpowersController < ApplicationController

  def index
    @superpowers = Superpower.all
  end

  def new
  end

  def create
  end

  def show
    @superpower = Superpower.find(params[:id])
  end

end
