require 'rails_helper'
RSpec.describe Comment, type: :model do
  before(:all) do
    @comment = Comment.create(contenido: "contenido")
  end
  it 'checks that a comment can be created' do
    expect(@comment).to be_valid
  end
  it 'checks that a comment can be read' do
    expect(Comment.find_by_contenido("contenido")).to eq(@comment)
  end
  it 'checks that a comment can be updated' do
    @comment.update(:contenido => "Like a Rolling Stone - Remastered")
    expect(Comment.find_by_contenido("Like a Rolling Stone - Remastered")).to eq(@comment)
  end
  it 'checks that a comment can be destroyed' do
    @comment.destroy
    expect(Comment.find_by(contenido: "Like a Rolling Stone - Remastered")).to be_nil
  end
end

