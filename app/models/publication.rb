class Publication < ApplicationRecord
    belongs_to :user 
    has_one_attached :image
    has_many :comments

    #relacion users request


    def self.search(search)
        if search
            self.where(titulo: search)
        else
            Publication.all
        end
    end

    def self.especie(search)
        if search
            self.where(especie: search)
        else
            Publication.all
        end
    end
    def self.tipo(search)
        if search
            self.where(tipo: search)
        else
            Publication.all
        end
    end

end

