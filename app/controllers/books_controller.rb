class BooksController < ApplicationController
  get '/books' do
    @users = User.all
    erb :'books/index'
  end

  get '/books/new' do
    if Helpers.logged_in?(session)
      erb :'books/new'
    else
      redirect '/login'
    end
  end

  post '/books' do
    if !params[:title].empty? && !params[:author].empty?
      @book = Book.new(params)
      @book.user = Helpers.current_user(session)
      @book.save
      redirect "/books/#{@book.id}"
    else
      flash[:error] = "Please enter the book's title and author at minimum to add your book to your reading list."
      redirect "/books/new"
    end
  end

  get '/books/:id' do
    @book = Book.find(params[:id])
    erb :'books/show'
  end

  get '/books/:id/edit' do
    @book = Book.find(params[:id])
    erb :'books/edit'
  end

  patch '/books/:id' do
    @book = Book.find(params[:id])
    @book.update(params.except(:_method))
    if @book.save
      redirect "/books/#{@book.id}"
    else
      redirect "/books/#{@book.id}/edit"
    end
  end

  delete '/books/:id' do
    @book = Book.find(params[:id])
    @book.destroy
    @user = Helpers.current_user(session)
    redirect "/users/#{@user.id}"
  end
end
