class ChatsController < ApplicationController
    def show
        @chats = Chat.where("requestor_id = ? OR receiver_id = ?", params[:id], params[:id])
        @chats_receiver = Chat.where("receiver_id = ?", params[:id])
        @chats_requestor = Chat.where("requestor_id = ?", params[:id])
        depurados = Chat.depurar(@chats, @chats_receiver, @chats_requestor)
        @chats = depurados[0]
        @chats_receiver = depurados[1]
        @chats_requestor = depurados[2]
        if @chats.nil?
            @chats = []
        end
        if @chats_receiver.nil?
            @chats_receiver = []
        end
        if @chats_requestor.nil?
            @chats_requestor = []
        end
    end

    def new
        @chat = Chat.new
    end

    def create
        @chat = chat.new(chat_params)
        if @chat.save
            redirect_to root_path   
        else
            render 'new' #va de nuevo a la vista de nombre new
        end
    end

    def send_chat_request
        @id1 = params[:requestor_id].to_i
        @id2 = params[:receiver_id].to_i
        @chats1 = Chat.where(requestor_id: @id1,receiver_id: @id2)
        @chats2 = Chat.where(requestor_id: @id2,receiver_id: @id1)
        if @chats1.empty? && @chats2.empty?
            @chat = Chat.create(requestor_id: params[:requestor_id],receiver_id: params[:receiver_id])
        end
        redirect_to  chats_show_path(params[:requestor_id])
    end

    def process_request
        @chat = Chat.find(params[:id])
        if params[:status] == "accepted"
            @chat.update(status: "accepted")
        else
            @chat.update(status: "declined")
        end
        redirect_to chats_show_path(params[:id_actual])
    end

    def destroy
        @chat = Chat.find(params[:id])
        @messages = Message.where("chat_id = ?", params[:id])
        @messages.each do |mensaje|
            mensaje.destroy
        end
        @chat.destroy
        redirect_to  chats_show_path(params[:id_actual])
    end

    private
    def chat_params
        params.require(:chat).permit(:requestor_id, :receiver_id)
    end    
end
