class PostsController < AplicationController
    def index
        @posts = Post.all
    end

    def show
        @id = params[:id]
    end

end