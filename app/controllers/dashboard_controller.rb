class DashboardController < ApplicationController
	before_filter :authorize, only: [:index]

	def index
		@posts = Post.all
		@comments = Comment.where(:flag => false)
	end
end
