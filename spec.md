# Specifications for the Sinatra Assessment

Specs:
- [X] Use Sinatra to build the app:
In my Rakefile I put: 
ENV["SINATRA_ENV"] ||= "development" and require 'sinatra/activerecord/rake’. 
In my Config Environment I put: 
Bundler.require(:default, ENV['SINATRA_ENV'])
ENV['SINATRA_ENV'] ||= "development"

- [X] Use ActiveRecord for storing information in a database:
In my Config Environment I put:
 ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)
In my Rakefile I put: require 'sinatra/activerecord/rake'
In my Gemfile I put: gem 'activerecord', '~> 5.2', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'

- [X] Include more than one model class (e.g. User, Post, Category):
I have 3 model classes: User, Watching, and Add.

- [X] Include at least one has_many relationship on your User model (e.g. User has_many Posts):
My User model has many Adds and my Watching model has many Adds. A User has many Watchings through Adds, and a Watching has many Users through Adds. 

- [X] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User):
An Add belongs to a User and a Watching. 

- [X] Include user accounts with unique login attribute (username or email):

A User logs in with a username and I validated the uniqueness of that attribute in my User model. 

- [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying: 

A User creates, reads, updates, and destroys Adds. A User can also be created, read, updated (just the name), and destroyed. A User can also create, read, update, and destroy Watchings. 

- [X] Ensure that users can't modify content created by other users:
For Users: To get the edit and delete User forms, the current_user (my helper method that finds the User by session) must be the User the form is for. 
For Watchings: To get the edit and delete Watching forms, the current_user.id must match the Watching’s creator_id (one of the Watching attributes). When a new Watching is created, I set the current_user.id to the creator_id to link the User to the Watching. 
For Adds: To patch or delete an Add, the current_user.id must match the Add user_id (one of the Add attributes). 

- [X] Include user input validations: 
For an Add: The only input attribute is a boolean of seen or unseen, so there was no need for additional validation of input. 
For a Watching: When creating or editing a Watching, the title, image_url, movie_or_show, and streaming_location params cannot be blank. 
For a User: I used has_secure_password to validate a User’s password. I validated the uniqueness of a username, which a User logs in with. And to create a new User, the username, name, and password params cannot be blank. A User can only edit their name, which cannot be blank. 

- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)

- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code:
My Readme has all of these, and I used the MIT license. 

Confirm
- [X] You have a large number of small Git commits: I have 26 commits.
- [X] Your commit messages are meaningful: I tried to be as specific as possible.
- [X] You made the changes in a commit that relate to the commit message: I tried to be as specific as possible.
- [X] You don't include changes in a commit that aren't related to the commit message: I tried to be as accurate as possible.  
