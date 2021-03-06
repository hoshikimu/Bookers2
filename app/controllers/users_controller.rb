class UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:edit]}
  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to user_path(current_user)
    end
  end

  def index
  	@user = current_user
  	@users = User.all
  	@book_new = Book.new
  end

  def show
  	@user = User.find(params[:id])
  	@book_new = Book.new
    @books = @user.books
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:notice] = "You have updated user successfully."
  		redirect_to user_path(@user)
  	else
  		render :edit
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
