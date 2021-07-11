class BooksController < ApplicationController
  get '/books' do
    erb :'books/index'
  end

  get '/books/new' do
    erb :'books/new'
  end

  post '/books' do
    @user = Helpers.current_user(session)
    if !params[:title].empty?
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
end
