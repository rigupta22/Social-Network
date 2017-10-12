# home controller
class HomeController < ApplicationController
  skip_before_action :logged_in?
end
