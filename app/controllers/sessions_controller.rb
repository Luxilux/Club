class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
     # Log the user in and redirect to the answer
      log_in user
      #the params hash for submitted login forms now includes a value based on the checkbox (’1’ if the box is checked and ’0’ if it isn’t)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to '/users'
    else
     # Create an error message
      flash.now[:danger] = 'change ton MDP direct mec'
      render 'new'
   end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
