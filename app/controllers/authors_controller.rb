class AuthorsController < ApplicationController

	def index
		@authors = Author.all
	end

	def show
		@author = Author.find(params[:id])
		@books = @author.books
	end

	def new
		@author = Author.new
	end

	def old
		@author=Author.find(params[:id])
	end

	def update
		@author.where(params[:id]).update_all(author_params)
	end

	def create
		@author = Author.new(author_params)
		if @author.save
			flash[:notice] = ""
			redirect_to '/authors'
		else
			flash[:notice] = 'Whoops, authors need names!'
			render 'new'
		end
	end


	def destroy
		@author = Author.find(params[:id])
		if @author.destroy
			redirect_to '/authors'
		else
			render '/authors/#{params[:id]}'
		end
	end

	def edit
		@author = Author.find(params[:id])
	end

	def update
		@author = Author.find(params[:id])
		if @author.update_attributes(author_params)
			redirect_to(:action => 'show', :id => @author.id)
		else
			render 'old'
		end
	end

	private
		def author_params
			params.require(:author).permit(:name, :biography, :birth, :death, :picture)
		end

end
