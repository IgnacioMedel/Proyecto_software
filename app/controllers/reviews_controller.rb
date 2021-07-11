class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    def index
        @reviews = Review.all
    end
  
    def show
        @reviews = Review.where("receiver_id = ?", params[:id])
        if @reviews.nil?
            @reviews = []
        end
    end
    
    def new
        @requestor = current_user
        @receiver = User.find(params[:receiver_id])
        @review = Review.new
    end
    
    def create
        @review = Review.new(review_params)
        if @review.save
            @user = User.find(@review.receiver_id)
            @actual = @user.clasificacion.to_i
            @nuevo = (@actual + @review.calificacion.to_i)/2
            @user.clasificacion = @nuevo
            @user.save
            redirect_to review_path(current_user.id)   
        else
            render 'new' #va de nuevo a la vista de nombre new
        end
    end
  
    def edit
    end
  
    def update
        if @review.update(review_params)
            redirect_to @review
        else
            render 'edit'
        end
    end
  
    def destroy
        @review = Review.find(params[:id])
        @review.destroy
  
        redirect_to reviews_path
    end
  
    private
    def review_params
        params.require(:review).permit(:requestor_id, :receiver_id, :calificacion, :contenido)
    end
  
    def set_review
        @review = Review.find_by(id: params[:id])
      end
  end
  
  

