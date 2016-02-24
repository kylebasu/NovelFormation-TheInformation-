class BooksController < ApplicationController

	def show
		@book = Book.find(params[:id])
	end

	def new
		@author = Author.find(params[:id])
		@book = @author.books.new
	end

	def create
		@author = Author.find(params[:id])
		@book = @author.books.new(book_params)
		url = '/authors/'  + params[:id]
		print url
		if @book.save
			flash[:notice] = ""
			redirect_to url
		else
			flash[:notice] = "Whoops, books need titles!"
			render 'new'
		end
	end

	def destroy
		@book = Book.find(params[:id])
		authorId = @book.author.id
		url = '/authors/' + authorId.to_s
		if @book.destroy
			redirect_to url
		else
			 'woops'
			render url
		end
	end
	
	private
		def book_params
			params.require(:book).permit(:title, :description, :author_id)
		end

end
