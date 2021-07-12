require_relative "spec_helper"

def app
  ApplicationController
end

describe ApplicationController do
  it "responds with a welcome message" do
    get '/'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Welcome to the Sinatra Template!")
  end

  describe UsersController do
    describe "Signup Page" do
      it "loads the signup page" do
        get '/signup'
        expect(last_response.status).to eq(200)
      end

      it "does not let a user sign up without username" do
        params = {
          :username => "",
          :email => "cyndilauperfan@aol.com",
          :password => "allthroughthenight"
        }
        post '/signup', params
        expect(last_response.location).to include("/signup")
        expect(last_response.body).to include("Missing Data")
      end

      it "does not let a user sign up without email" do
        params = {
          :username => "franniepak",
          :email => "",
          :password => "allthroughthenight"
        }
        post '/signup', params
        expect(last_response.location).to include("/signup")
        expect(last_response.body).to include("Missing Data")
      end

      it "does not let a user sign up without password" do
        params = {
          :username => "franniepak",
          :email => "cyndilauperfan@aol.com",
          :password => ""
        }
        post '/signup', params
        expect(last_response.location).to include("/signup")
        expect(last_response.body).to include("Missing Data")
      end

      it "lets a new user sign up and redirects to their user page" do
        params = {
          :username => "franniepak",
          :email => "cyndilauperfan@aol.com",
          :password => "allthroughthenight"
        }
        post '/signup', params
        expect(last_response.location).to include("/users/#{user.id}")
      end

      it 'does not let a logged in user view the signup page' do
      user = User.create(:username => "skittles123", :email => "skittles@aol.com", :password => "rainbows")
      params = {
        :username => "skittles123",
        :email => "skittles@aol.com",
        :password => "rainbows"
      }
      post '/signup', params
      get '/signup'
      expect(last_response.location).to include("/users/#{user.id}")
    end

    end
    describe "Login Page" do

      it "loads the login page" do
        get '/login'
        expect(last_response.status).to eq(200)
      end

      it "lets a user login and redirects to their user page" do
        user = User.create(:username => "kennyG", :email => "Gman@hotmail.com", :password => "saxxxman")
        params = {
          :username => "kennyG",
          :password => "saxxxman"
        }
        post '/login', params
        expect(last_response.location).to include("/users/#{user.id}")
      end

      it "does not let a user login with incorrect password" do
        user = User.create(:username => "kennyG", :email => "Gman@hotmail.com", :password => "saxxxman")
        params = {
          :username => "kennyG",
          :password => "saxman"
        }
        post '/login', params
        expect(last_response.location).to include("/login")
        expect(last_response.body).to include("Incorret Login Information")
      end

    end

    describe "User Page" do

    end

    describe "Logout" do

    end

  end

  describe BooksController do
    describe "Books" do

    end

    describe "Individual Book" do

    end

    describe "Edit Book" do

    end

    describe "Delete Book" do

    end
  end




end
