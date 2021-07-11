class History < ApplicationRecord
    # Asociacion requests con user
    belongs_to :historier, class_name: :User #Solicitud pertenece a un solicitante
    belongs_to :receiver, class_name: :User  #Solicitud pertenece a un solicitado

    has_one :publication, :through => :user #no estoy seguro de esta linea.

    def self.historier(id)
        @historier = User.find(id)
    end
    
end