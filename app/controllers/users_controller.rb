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

    @user = User.new(user_params)
    @user.password = user_params[:password]

    if @user.save
      login(@user)
      redirect_to "users/#{@user.id}"
    else
      # TODO Show the user a descriptive error message
      redirect_to '/'
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

  private
      def user_params
        params.require(:user).permit!
      end


end
