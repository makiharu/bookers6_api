class BookCommentsController < ApplicationController
	#before_action :baria_user, only: [:edit, :update, :destroy]
	before_action :ensure_correct_user,only: [:destroy]



	def create
		book = Book.find(params[:book_id])
		
		book_comment = BookComment.new(book_comment_params)
		book_comment.book_id = book.id
		book_comment.user_id = current_user.id
		#binding.pry
		if book_comment.save
		  redirect_back(fallback_location: root_path)
		end
	end


	def destroy
		#book_comment = BookComment.find(params[:book_id])　book_idを取得する必要はない
		book_comment = BookComment.find(params[:id])
		#book_comment = current_user.book_comments.find_by(book_id: book.id) いらない
		book_comment.destroy
		redirect_back(fallback_location: root_path)
	end

	private

	def book_comment_params
		params.require(:book_comment).permit(:content)
	end

	 def ensure_correct_user
      	book_comment = BookComment.find(params[:id])

        if book_comment.user_id != current_user.id
        	redirect_to book_path(book_comment.book)
      	end
    end



end
