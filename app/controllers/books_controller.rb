class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :ensure_correct_user, {only: [:edit]}
	def ensure_correct_user
		@book = Book.find(params[:id])
		if current_user.id != @book.user_id
			redirect_to books_path
		end
	end

	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
	end

	def show
		@book = Book.new
		@book_detail = Book.find(params[:id])
		@post_comment_new = PostComment.new
		@post_comments = @book_detail.post_comments
	end

	def create
		@user = current_user
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@books = Book.all
		if @book.save
			flash[:notice] = "You have created book successfully."
			redirect_to book_path(@book)
		else
			render :index
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
  		if @book.update(book_params)
	  		flash[:notice] = "You have updated book successfully."
	  		redirect_to book_path(@book)
  		else
  			render :edit
  		end
	end

	def destroy
		Book.find(params[:id]).destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
