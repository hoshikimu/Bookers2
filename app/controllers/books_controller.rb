class BooksController < ApplicationController
	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
	end

	def show
		@user = User.find(params[:id])
		@book = Book.find(params[:id])
	end

	def edit
	end

	def new
		
	end

	def create
		@book = Book.new(book_params)
		@books = Book.all
		if @book.save
			redirect_to book_path(@book)
		else
			render :index
		end
	end

	def update
		
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
