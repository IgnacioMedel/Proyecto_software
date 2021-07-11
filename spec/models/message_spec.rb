require 'rails_helper'

RSpec.describe Message, type: :model do
  before(:all) do
    @message = Message.create(contenido: "contenido contenido")
  end
  it 'checks that a Message can be created' do
    expect(@message).to be_valid
  end
  it 'checks that a message can be read' do
    expect(Message.find_by_contenido("contenido contenido")).to eq(@message)
  end
  it 'checks that a message can be updated' do
    @message.update(:contenido => "Like a Rolling Stone - Remastered")
    expect(Message.find_by_contenido("Like a Rolling Stone - Remastered")).to eq(@message)
  end
  it 'checks that a message can be destroyed' do
    @message.destroy
    expect(Message.find_by(contenido: "Like a Rolling Stone - Remastered")).to be_nil
  end
end
