class SessionsController < ApplicationController
  #login form
  def new
  end
#login post
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to '/'
    else
      @user
      render 'new'
    end
  end
#logout
  def destroy
    session = nil
    redirect_to '/login'
  end
end
