class SuperpowersController < ApplicationController
  def index
    @superpowers = Superpower.all
  end

  def show
    @superpower = Superpower.find(params[:id])
    @superheroes = Superhero.all.select {|hero| hero.superpower == @superpower }
  end

end
