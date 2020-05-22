class FavoritesController < ApplicationController

	def create
		@book = Book.find(params[:book_id])
		favorite = Favorite.new(user_id:current_user.id,book_id:params[:book_id])
		#favorite = @book.favorites.new(user_id: current_user.id) #いいねはできる
		favorite.save
		 #redirect_back(fallback_location: root_path) #いらない
	end

	def destroy
		@book = Book.find(params[:book_id])
		favorite = @book.favorites.find_by(book_id:params[:book_id],user_id:current_user.id)
		favorite.destroy
		#redirect_back(fallback_location: root_path) Ajaxのときはいらない
	end
end



	
