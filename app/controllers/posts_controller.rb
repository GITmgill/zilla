class PostsController < ApplicationController
	before_filter :authorize, only: [:edit, :update, :destroy, :create, :new]
	before_filter :find_post, only: [:show, :update, :destroy, :edit]

	def index
	  @posts = Post.where(:state => "published").order("created_at DESC")
	end

	def new
		@post = Post.new
	end

	def show
		redirect_to_good_slug(@post) and return if bad_slug?(@post)
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to dashboard_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to dashboard_path
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to dashboard_path
	end

	private
	  def post_params
	    params.require(:post).permit(:title, :text, :author, :short, :photo, :state)
	  end
	  def find_post
	  	@post = Post.find(params[:id])
	  end
end
