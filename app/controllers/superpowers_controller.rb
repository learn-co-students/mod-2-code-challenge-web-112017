class SuperpowersController < ApplicationController
  def index
    @superpowers = Superpower.all
  end

  #the instructions do not suggest superpowers can be created or edited or deleted.


  def show
    @superpower = Superpower.find(params[:id])
  end

end
