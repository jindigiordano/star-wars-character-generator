class CharactersController < ApplicationController
  include CharactersHelper

  # index
  def index
    @characters = Character.all
  end

  # new
  def new
    if current_user
      render 'characters/new'
    else
      #TODO show user a helpful error message
      redirect_to '/login'
    end
  end

  # create
  def create
    species_num = rand_species
    species_obj = JSON.parse(Swapi.get_species species_num)

    planet_num = rand_planet
    planet_obj = JSON.parse(Swapi.get_planet planet_num)

    @character = Character.new({
      name: params[:name],
      gender: params[:gender],
      species: species_obj["name"],
      species_id: species_num,
      homeplanet: planet_obj["name"],
      homeplanet_id: planet_num,
      profession: rand_profession,
      user_id: current_user.id,
      backstory: ""
    })

    if @character.save
      @user = User.find(@character.user_id)
      render action: "show"
    else
      redirect_to '/characters/new'
    end
  end

  # show
  def show
    @character = Character.find(params[:id])
    @user = User.find(@character.user_id)
  end

  # destroy
  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to 'characters'
  end
end
