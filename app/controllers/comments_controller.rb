class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :edit, :update, :destroy]
    def index
        @comments = Comment.all
    end
  
    def show
    end
    
    #def new
     #   @comment = Comment.new #carcasa, no se guarda en la db, metodo de modelo.    
    #end
    def create
        @publication = Publication.find(params[:publication_id])  
        if @comment = @publication.comments.create(comment_params)
            redirect_to publications_path
        else
            redirect_to publications_path
        end
    end
  
    def edit
    end
  
    def update
        if @comment.update(comment_params)
            redirect_to @comment
        else
            render 'edit'
        end
    end
  
    def destroy
        @comment = Comment.find_by(id: params[:id])
        @comment.destroy
  
        redirect_to comments_path
    end
  
    private
    def comment_params
        params.require(:comment).permit(:contenido)
    end
  
    def set_comment
        @comment = Comment.find_by(id: params[:id])
      end
  end