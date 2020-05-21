class FavoritesController < ApplicationController

	def create
	  @book = Book.find(params[:book_id]) 
	  @favorite = Favorite.new(user_id: current_user.id, book_id: book.id)
	  @favorites = @book.favorites
	  #@favorite = current_user.favorites.build(book_id: :book_id)
	  @favorite.save
	  #redirect_back(fallback_location: root_path) #いらない
	end

	def destroy
	  @book = Book.find(params[:book_id])
	  #@favorite = current_user.favorites.find_by(book_id: book.id)
	  @favorite = Favorite.find_by(book_id: book_id, user_id: current_user.id)
	  @favorite.destroy
	  #redirect_back(fallback_location: root_path)
	  # request.referer
	end

end
