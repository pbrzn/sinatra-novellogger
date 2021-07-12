require 'bcrypt'

class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
      session[:user_id] = @user_id
      redirect "/users/#{@user.id}"
    else
      # ADD ERROR HERE
      redirect "/signup"
    end
  end

  get '/login' do
    if !Helpers.logged_in?(session)
      erb :'users/login'
    else
      @user = User.find(session[:user_id])
      redirect "/users/#{@user.id}"
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      # ADD ERROR HERE
      redirect "/login"
    end
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    @in_progress = @user.books.select {|book| book.progress == "In Progress" }
    @finished = @user.books.select {|book| book.progress == "Finished" }
    @unread = @user.books.select {|book| book.progress == "Unread" }
    erb :'users/show'
  end

  post '/logout' do
    session.clear
    redirect '/login'
  end

end
