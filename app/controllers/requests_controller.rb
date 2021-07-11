class RequestsController < ApplicationController
    before_action :set_request, only: [:show, :edit, :update, :destroy]
    def index
        @requests = Request.all
    end
  
    def show
        @requests = Request.pending(params[:id])
        @requestors = Request.requestor(params[:id])
    end
    
    def new
        @request = Request.new #carcasa, no se guarda en la db, metodo de modelo.    
        @user_receiver = User.find(params[:receiver_id])
        @publication = Publication.find(params[:publication_id])
    end
    
    def create
        @request = Request.new(request_params)
        if @request.save
            redirect_to request_path(current_user.id)   
        else
            render 'new' #va de nuevo a la vista de nombre new
        end
    end
  
    def edit
    end
  
    def update
        if @request.update(request_params)
            redirect_to @request
        else
            render 'edit'
        end
    end
  
    def destroy
        @request = Request.find_by(id: params[:id])
        @request.destroy
  
        redirect_to requests_path
    end

    def process_request
        @request = Request.find(params[:id])
        if params[:status] == "accepted"
            @request.update(status: "accepted")
            @history = History.new
            @history.historier_id = @request.requestor_id
            @history.receiver_id = @request.receiver_id
            @history.publication_id = @request.publication_id 
            @history.tipo = Publication.find(@request.publication_id).tipo
            @history.save
            @publicacion = Publication.find(@request.publication_id)
            @publicacion.vigente = false 
        else
            @request.update(status: "declined")
        end
        redirect_to request_path(@request.receiver_id)
    end
  
    private
    def request_params
        params.require(:request).permit(:contenido, :requestor_id, :receiver_id, :status, :publication_id)
    end
  
    def set_request
        @request = Request.find_by(id: params[:id])
      end
  end
