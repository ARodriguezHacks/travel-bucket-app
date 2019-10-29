module SessionsHelper
  def create_session(user)
    session[:user_id] = user.id
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def destroy_session(user)
    session[:user_id] = nil
  end

  def current_user
    if (user_id = session[:user_id])
      @curent_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        create_session(user)
        @current_user = user
      end
    end
    #User.find_by(id: session[:user_id])
  end
end
