class HomeController < ApplicationController
  #
  # index
  # Required to redirect user to another pages based on roles
  #
  def index
    redirect_to dashboard_index_path
  end
end
