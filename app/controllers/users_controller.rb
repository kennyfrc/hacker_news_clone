class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
      if @user.save
        sign_in @user
        redirect_to posts_path
        # redirect_to signin_path
      else
        render action: "new"
      end
  end

end
