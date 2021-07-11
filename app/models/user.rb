class User < ApplicationRecord
  #Con ActiveStorage
  has_one_attached :image
  has_many :publications
  has_many :comments, through: :publications

  #Asociacion user con request
  has_many :requests_as_requestor,
    foreign_key: :requestor_id,
    class_name: :Request
  
  has_many :requests_as_receiver,
    foreign_key: :receiver_id,
    class_name: :Request

  #Asociacion user - chat
    has_many :chats_as_requestor,
    foreign_key: :requestor_id,
    class_name: :Chat
  
  has_many :chatss_as_receiver,
    foreign_key: :receiver_id,
    class_name: :Chat



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
