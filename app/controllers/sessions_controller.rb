class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to posts_path
    else
      flash.now[:notice] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    logger.info("we are destroying")
     sign_out
     flash[:error] = "You're out"
     redirect_to root_path
   end
end
