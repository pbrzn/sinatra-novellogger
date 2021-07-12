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

    end
    describe "Login Page" do
      it "lets a user login" do
        user = User.new(:username => "kennyG", :password => "saxxxman")
        params = {
          :username => "kennyG",
          :password => "saxxxman"
        }
        post '/login', params
        expect(last_response.location).to include("/users/#{user.id}")
      end

      it "does not let a user login with incorrect password" do

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
