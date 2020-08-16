class UsersController < ApplicationController
  def signout
    signout
    flash[:notice] = "Successfully Signed out"
    redirect_to "/"
  end

  def show

  end
end
