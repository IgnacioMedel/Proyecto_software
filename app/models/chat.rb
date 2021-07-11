class Chat < ApplicationRecord
# Asociacion chat-usuario
    belongs_to :requestor, class_name: :User #Solicitud pertenece a un solicitante
    belongs_to :receiver, class_name: :User  #Solicitud pertenece a un solicitado
    
    def self.pending(id)
        @pendings = Request.where(receiver_id: id, status: "pending")
    end

    def self.requestor(id)
        @requestor = User.find(id)
    end

    def self.depurar(todos, solicitados, solicitantes)
        todos_2 = []
        solicitado_2 = []
        solicitante_2 = []
        solicitados.each do |solicitado|
            if solicitado.status == "pending"
                solicitado_2 << solicitado
            end
        end
        solicitantes.each do |solicitante|
            if solicitante.status == "pending"
                solicitante_2 << solicitante
            end
        end
        todos.each do |chat|
            if chat.status == "accepted"
                todos_2 << chat
            end
        end
        return todos_2, solicitado_2, solicitante_2
    end
    
end
