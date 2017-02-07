class SessionsController < ApplicationController

  def create
    @params = params
    @user = User.find_by(username: params[:username])
    if @user && @user.password == params[:password]
      login(@user)
      redirect_to '/'
    else
      redirect_to 'sessions#login'
    end
  end

  # delete '/sessions' do
  def destroy
    logout
    redirect_to '/'
  end
end
