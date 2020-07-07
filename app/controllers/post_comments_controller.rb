class PostCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    @post_comment_new = PostComment.new(post_comment_params)
    @post_comment_new.user_id = current_user.id
    @post_comment_new.book_id = book.id
    @book_detail = Book.find(params[:book_id])
    @post_comments = @book_detail.post_comments
    @post_comment_new.save
    #   redirect_to book_path(book)
    # else
    # @book = Book.new
    #   render "books/show"
    # end
  end

  def destroy
    book = Book.find(params[:book_id])
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    # redirect_to book_path(book)
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
