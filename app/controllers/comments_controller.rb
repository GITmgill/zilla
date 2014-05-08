class CommentsController < ApplicationController
	before_filter :authorize, only: [:destroy, :create, :edit]
	before_action :find_comments, only: [:destroy, :create, :edit]
	before_action :post_comment_find, only: [:edit, :destroy]

	def create
		@comment =
		@post.comments.create(comments_params)
		redirect_to post_path(@post)
	end

	def edit
		@comment.update_attribute(:flag, 'true')
		redirect_to post_path(@post)
	end

	def destroy
		@comment.destroy
		redirect_to post_path(@post)
	end

	private
		def comments_params
			params.require(:comment).permit(:commenter, :body)
		end
		def find_comments
			@post = Post.find(params[:post_id])
		end
		def post_comment_find
			@comment = @post.comments.find(params[:id])
		end
end
