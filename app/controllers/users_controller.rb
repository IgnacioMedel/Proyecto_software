class UsersController < ApplicationController
    def index
      @users = User.all
      @solicitudes_admin = WannaBeAdministrator.where(status: "pending")
      if @solicitudes_admin.nil?
        @solicitudes_admin = []
      end
    end

    def show
      @user = User.find(params[:id]) 
    end 

    def destroy
      @user = User.find(params[:id])
      if @user.image.attached?
         @user.image.purge
      end
      redirect_to edit_user_registration_path(params[:id])
    end

    def delete_specific_user
      if (current_user.administrador) || (current_user.id.to_i == params[:id].to_i)
        redireccion = users_path
        if current_user.id.to_i == params[:id].to_i
          redireccion = root_path
        end
        @user = User.find(params[:id])
        @id = @user.id

        #Chats y mensajes
        @chats = Chat.where("requestor_id = ? OR receiver_id = ?", @id, @id)
        if @chats.nil?
          @chats = []
        end
        @chat_id = []
        @chats.each do |chat|
          @chat_id << chat.id
        end
        @chat_id.each do |id|
          @messages = Message.where("chat_id = ?", id)
          if @messages.nil?
            @messages = []
          end
          @messages.each do |mensaje|
              mensaje.destroy
          end
        end
        @chats.each do |chat|
          chat.destroy
        end

        #Request para ser usuario
        @requests = WannaBeAdministrator.where(requestor_id: @id)
        if @requests.nil?
          @requests = []
        end
        @requests.each do |request|
          request.destroy
        end
        
        #Reviews que ha hecho y recibido

        @reviews = Review.where("requestor_id  = ? OR receiver_id = ?", @id, @id)
        if @reviews.nil?
          @reviews = []
        end
        @reviews.each do |review|
          review.destroy
        end

        #Publicaciones que ha hecho

        @publications = Publication.where("user_id = ?", @id)
        if @publications.nil?
          @publications = []
        end
        @publications.each do |publication|
          publication.destroy
        end

        #Comentarios

        #Usuario
        if @id == current_user.id
          sign_out @user
        end
        @user.destroy

        # FALTA ELIMINAR PUBLICACIONES, REQUESTS Y COMENTARIOS

        redirect_to redireccion
      end
    end
end