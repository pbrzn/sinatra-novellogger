
# Novellogger

An interactive reading list built using Sinatra. You can upload books to your reading list, track your progress, and note your thoughts on your books.

## Installation

Simply fork and clone this repo, and perform ```bundle install```. Then navigate to the ```sinatra-novellogger``` directory in your temrinal and migrate/seed the database. Type ```shotgun``` in the command line. Navigate to your localhost port 9393 in your browser and then you're ready to use Novellogger!

## Usage

Novellogger utilizes two models: User and Book. Each model has it's own respective controller that inherits from the ApplicationController class.

Here are Novellogger's routes:
  - / (The Novellogger Homepage)
  - User routes:
    - /signup
    - /login
      - All passwords are encrypted using the bcrypt gem.
    - /users/:id (Individual user's page)
  - Book routes:
    - /books (All books currently logged on Novellogger)
    - /books/new (Form for logged in user to add a new book)
    - /books/:id (An individual book's page)
      - this page has an added Delete Entry button that deletes the book from the database.
    - /books/:id/edit (Allows logged in user to edit a book if it belongs to them)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pbrzn/sinatra-novellogger. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/pbrzn/sinatra-novellogger/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Novellogger project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/pbrzn/sinatra-novellogger/blob/master/CODE_OF_CONDUCT.md).
