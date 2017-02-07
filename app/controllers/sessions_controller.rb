class SessionsController < ApplicationController

  #new
  # get '/sessions/new' do
  def new
    erb :'/sessions/new'
  end

  def create
    @params = params
    @user = User.find_by(username: params[:username])
    if @user && @user.password == params[:password]
      login(@user)
      redirect '/'
    else
      erb :'/sessions/new'
    end
  end

  # delete '/sessions' do
  def destroy
    logout
    redirect '/'
  end
end
