class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@books = Book.where(id: params[:id])
  	@book = Book.new
  end
end
