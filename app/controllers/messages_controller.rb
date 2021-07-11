class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :edit, :update, :destroy]
    def index
        @messages = Message.all
    end
  
    def show
        @messages = Message.where("chat_id = ?", params[:id])
        if @messages.nil?
            @messages = []
        end
        @chat_info = Chat.find(params[:id])
    end
    
    def new
        # @message = Message.new #carcasa, no se guarda en la db, metodo de modelo.    
    end
    def create
        @message = Message.new(message_params)
        if @message.save
            redirect_to message_path(message_params[:chat_id])  
        else
            render 'new' #va de nuevo a la vista de nombre new
        end
    end
  
    def edit
    end
  
    def update
        if @message.update(message_params)
            redirect_to @message
        else
            render 'edit'
        end
    end
  
    def destroy
        @message = Message.find_by(id: params[:id])
        @message.destroy
  
        redirect_to messages_path
    end
  
    private
    def message_params
        params.require(:message).permit(:chat_id, :speaker_id, :contenido)
    end
  
    def set_message
        @message = Message.find_by(id: params[:id])
      end
  end

