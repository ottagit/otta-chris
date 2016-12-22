class UsersController < ApplicationController

  def show
   @user = User.find(params[:id])  
   # debugger
  end

  def new
   @user = User.new
  end

  def create
   @user = User.new(params[user_params]) # Not the final implementation
   if @user.save
     # Handle a successful save
   else
    render 'new'
   end
  end

  private
  # Auxiliary method to be used internally by the Users controller
   def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end
end
