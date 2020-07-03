class PostCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.user_id = current_user.id
    @post_comment.book_id = book.id
    if @post_comment.save
      redirect_to book_path(book)
    else
      @book_detail = Book.find(params[:book_id])
      @book = Book.new
      @post_comments = @book_detail.post_comments
      render "books/show"
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    redirect_to book_path(book)
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
