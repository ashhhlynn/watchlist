require './config/environment'
use Rack::MethodOverride


run ApplicationController


use AddsController
use WatchingsController
use UsersController


