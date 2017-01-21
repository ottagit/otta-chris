module SessionsHelper
 
 # Logs in the given user
 def log_in(user)
  session[:user_id] = user.id
 end

 # Remembers a user in a persistent session
 def remember(user)
  # Generate a remember token and create save its digest to the db
  user.remember
  # Use cookies to create permanent cookies for the user id 
  # and remember token
  cookies.permanent.signed[:user_id] = user.id 
  cookies.permanent[:remember_token] = user.remember_token
 end

 # Returns the current logged-in user(if any)
 def current_user
  @current_user ||= User.find_by(id: session[:user_id])
 end

 # Returns true if the user is logged in, false otherwise
 def logged_in?
  !current_user.nil?
 end

 def log_out
  session.delete(:user_id)
  @current_user = nil
 end
end
