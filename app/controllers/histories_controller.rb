class HistoriesController < ApplicationController
    before_action :set_history, only: [:show, :edit, :update, :destroy]
    def index
        @histories = History.all
    end
  
    def show
        @historiers = History.where("historier_id = ? or receiver_id = ?", params[:id], params[:id])
        if @historiers.nil?
            @historiers = []
        end
    end
    
    def new
        @history = History.new #carcasa, no se guarda en la db, metodo de modelo.    
    end
    
    def create
        @history = History.new(history_params)
        if @history.save
            redirect_to histories_path   
        else
            render 'new' #va de nuevo a la vista de nombre new
        end
    end
  
    def edit
    end
  
    def update
        if @history.update(history_params)
            redirect_to @history
        else
            render 'edit'
        end
    end
  
    def destroy
        @history = History.find_by(id: params[:id])
        @history.destroy
  
        redirect_to histories_path
    end
  
    private
    def history_params
        params.require(:history).permit(:historier_id, :receiver_id, :tipo, :publication_id)
    end
  
    def set_history
        @history = History.find_by(id: params[:id])
    end
end

