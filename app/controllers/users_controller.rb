class UsersController < ApplicationController
  # index
  def index
    @users = User.all
  end

  # create
  def create
    # if params[:password] != params[:confirm_password]
    #   # TODO show the user an error message
    #   return erb :'users/new'
    # end

    @user = User.new(params[:user])
    @user.password = params[:password]

    if @user.save
      login(@user)
      redirect "users/#{@user.id}"
    else
      # TODO Show the user a descriptive error message
      erb :'users/_new'
    end
  end

  # new
  def new
    erb :'users/_new'
  end

  # show
  def show
    @user = User.find(params[:id])
    @characters = @user.characters
  end
end
