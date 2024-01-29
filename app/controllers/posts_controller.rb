class PostsController < ApplicationController
    def index
    end
  
    def new
      @post = Post.new
    end
  
    def show
      @post = Post.find_by(id: params[:id])
    end

    def create
        @post = Post.new(post_params)
        params[:post][:question] ? @post.question = params[:post][:question].join("") : false
        if @post.save
            flash[:notice] = "診断が完了しました"
            redirect_to post_path(@post.id)
        else
            redirect_to :action => "new"
        end
      end
    
    private
      def post_params
          params.require(:post).permit(:id, question: [])
      end
end
