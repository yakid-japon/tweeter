class PostsController < ApplicationController
    def index
        @posts= Post.all
    end

    def new
        @post= Post.new
    end

    def show 
        @post = Post.find(params[:id])
    end

    def confirm
        @post = Post.new(posts_params)
    end

    def edit
       @post=Post.find(params[:id])
    end


    def create
        @post=Post.new(posts_params)
     
        if @post.save
        redirect_to posts_path, notice: "J'ai éffectué un tweet ♣"
        else
           render :new
        end
    end

    def update
        @post=Post.find(params[:id])
        if @post.update(posts_params)
           redirect_to posts_path, notice: "J'ai Modifié le tweet ♣"
        else
           render :new
        end
    end


    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path, notice: "J'ai Supprimé le tweet !!!"
    end


    private
 def posts_params
   params.require(:post).permit(:nom, :content, :title)
 end
end
