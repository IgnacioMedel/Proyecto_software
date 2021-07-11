class PublicationsController < ApplicationController
    before_action :set_publication, only: [:show, :edit, :update, :destroy, :cambiar]
    def index
        @publications = Publication.search(params[:search])
        @publications_2 = Publication.especie(params[:especie])
        @publications_3 = Publication.tipo(params[:tipo])
    end

    def show
        @publication = Publication.find(params[:id]) 
    end

    def new
        @publication = Publication.new
    end


    def create
        @user = current_user
        @publication = @user.publications.new(publication_params)
        if @publication.save
            redirect_to show_user_publications_path(@user.id)
        else
            puts @publication.errors.full_messages
            redirect_to users_path
        end
    end

    def edit
        
    end

    def update
        if @publication.update(publication_params)
            redirect_to @publication
        else
            render 'edit'
        end
    end

    def destroy
        @publication = Publication.find_by(id: params[:id])

        #eliminar comentarios asociados
        @comments = Comment.where("publication_id = ?", @publication.id)
        if @comments.nil?
            @comments = []
        end
        @comments.each do |comentario|
            comentario.destroy
        end

        #eliminar las request de la publicacion
        @requests = Request.where("publication_id = ?", @publication.id)
        if @requests.nil?
            @requests = []
        end
        @requests.each do |request|
            request.destroy
        end

        #Borrar del historial de la gente
        @histories = History.where("publication_id = ?", @publication.id)
        if @histories.nil?
            @histories = []
        end
        @histories.each do |historia|
            historia.destroy
        end

        @publication.destroy

        redirect_to root_path
    end

    def show_user
        @publications = Publication.where("user_id = ?", params[:id])
        @user = User.find(params[:id])
        if @publication.nil?
            @publication = []
        end
    end

    private
    def publication_params
        params.require(:publication).permit(:titulo, :image, :especie, :tipo, :precio, :direccion, :search)
    end

    def set_publication
        @publication = Publication.find_by(id: params[:id])
    end
end


