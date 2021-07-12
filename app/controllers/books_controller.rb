class BooksController < ApplicationController
  get '/books' do
    @books = Book.all
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
      @book.user = @user
      @book.save
      redirect "/books/#{@book.id}"
    else
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
    @book.update(params)
    if @book.save
      redirect "/books/#{@book.id}"
    else
      redirect "/books/#{@book.id}/edit"
    end
  end

  delete '/books/:slug' do
    @book = Book.find(params[:id])
    @book.destroy
  end
end
