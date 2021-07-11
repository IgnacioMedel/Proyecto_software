class PublicController < ApplicationController
    def main
        @publications = Publication.search(params[:search])
        @publications_2 = Publication.especie(params[:search])
        @publications_3 = Publication.tipo(params[:search])
    end

    def contact
    end
end
