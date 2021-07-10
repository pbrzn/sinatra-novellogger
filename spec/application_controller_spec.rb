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
end
#
# describe UsersController do
#   describe "Signup Page" do
#     it "loads the signup page" do
#       get '/signup'
#       expect(last_response.status).to eq(200)
#     end
#
#     it "lets a new user sign up and redirects to their user page" do
#       params = {
#         :username => "bowie72",
#         :email => "ziggystardust@aol.com",
#         :password => "somecatfromjapan"
#       }
#       post '/signup', params
#       expect(last_response.location).to include("/user/#{user.slug}")
#     end
#
#     it "" do
#     end
#
#   end
#   describe "Login Page" do
#
#   end
#
#   describe "User Page" do
#
#   end
#
#   describe "Logout" do
#
#   end
#
# end
#
# describe BooksController do
#   describe "Books" do
#
#   end
#
#   describe "Individual Book" do
#
#   end
#
#   describe "Edit Book" do
#
#   end
#
#   describe "Delete Book" do
#
#   end
# end
