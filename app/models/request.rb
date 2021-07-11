class Request < ApplicationRecord
    # Asociacion requests con user
    belongs_to :requestor, class_name: :User #Solicitud pertenece a un solicitante
    belongs_to :receiver, class_name: :User  #Solicitud pertenece a un solicitado

    # has_one :publication, :through => :user

    def self.pending(id)
        @pendings = Request.where(receiver_id: id, status: "pending")
    end

    def self.requestor(id)
        @requestor = User.find(id)
    end
    
end
