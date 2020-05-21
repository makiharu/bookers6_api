class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @newbook = Book.new
  
    @book_comment = @book.book_comments.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comments = @book.book_comments #@をつけ忘れて、エラーになってた！右辺つけ忘れないように

  #redirectを消去することで、jsファイルを読み込んでくれるようになる


  end

  def destroy
    @book_comment = BookComment.find(params[:id])
   # if @book_comment.user != current_user
    #  redirect_to request.referer
    #end
    if @book_comment.destroy
      render :index
    end
     # redirect_back(fallback_location:root_path)
    
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:content)
  end

end

