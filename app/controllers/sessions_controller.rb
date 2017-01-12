class SessionsController < ApplicationController
  def new
  end

  def create
   user = User.find_by(email: params[:session][:email].downcase)
   if user && user.authenticate(params[:session][:pasword]) 
    # Log the user in and redirect to the user show page
   else
    flash.now[:danger] = 'Invalid email/passsword combination' # Not quite right
    render 'new'
   end
  end

  def destroy
  end
end
