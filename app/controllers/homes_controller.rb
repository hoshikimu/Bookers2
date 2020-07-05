class HomesController < ApplicationController
  before_action :forbit_login_user

  def forbit_login_user
    user = current_user
    if user_signed_in?
      redirect_to user_path(user)
    end
  end
  
  def top
  end

  def about
  end

end