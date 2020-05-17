class CommentsController < ApplicationController
	def create
		book = Book.find(params[:book_id])
		comment = Comment.new(user_id: current_user, book_id: book.id)
		comment.save
		redirect_to book_path
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end

end
