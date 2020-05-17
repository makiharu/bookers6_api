class CommentsController < ApplicationController
	#before_action :baria_user, only: [:edit, :update, :destroy]
	before_action :ensure_correct_user,only: [:edit,:update,:destroy]

	def create
		book = Book.find(params[:book_id])
		comment = Comment.new(user_id: current_user.id, book_id: book.id)
		comment.save
		redirect_to book_path(book)
	end

	def edit
		#book = Book.find(params[:book_id])
		@comment = Comment.find(params[:book_id]) #bookに紐づいてるから
	end

	def update
		@comment = Comment.find(params[:book_id])
		if @comment.update(comment_params)
			redirect_to books_path, notice: "successfully updated comment!"
		else
			render 'edit'
		end
	end

	def destroy
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end

	  #url直接防止　メソッドを自己定義してbefore_actionで発動。
 # def baria_user
  #  unless params[:id].to_i == current_user.id
   #   redirect_to user_path(current_user)
    #end
  #end

    def ensure_correct_user
        @comment = Comment.find(params[:book_id])
      if @comment.user_id != current_user.id
        redirect_to books_path
      end
    end
end
