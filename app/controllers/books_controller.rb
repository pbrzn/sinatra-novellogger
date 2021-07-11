class BooksController < ApplicationController
  get '/books' do
    @books = Book.all
    @users = User.all
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

  get '/books/:id/edit' do
    @book = Book.find(params[:id])
    erb :'books/edit'
  end

  patch '/books/:id' do
    @book = Book.find(params[:id])
    @book.title = params[:title] if !params[:title].empty?
    @book.author = params[:author] if !params[:author].empty?
    @book.year_of_publication = params[:year_of_publication] if !params[:year_of_publication].nil?
    @book.category = params[:category] if !params[:category].empty?
    @book.genre = params[:genre] if !params[:genre].empty?
    @book.progress = params[:progress]
    @book.user_rating = params[:user_rating]
    @book.user_review = params[:user_review] if params[:user_review] != ""
    @book.save
    redirect "/books/#{@book.id}"
  end

end
