class UsersController < ApplicationController
  # index
  def index
    @users = User.all
  end

  def new
  end

  # create
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to "/"
    else
      # TODO Show the user a descriptive error message
      redirect_to '/'
    end
  end


  # show
  def show
    @user = User.find(params[:id])
    @characters = @user.characters
  end

  private
      def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end


end
