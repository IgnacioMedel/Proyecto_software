require 'rails_helper'

RSpec.describe 'Publications content', type: :system do
    it 'shows the publications text' do
        visit publications_path
        expect(page).to have_content('Publicaciones')
    end
end

RSpec.describe 'Comments content', type: :system do
    it 'shows the comments text' do
        visit comments_path
        expect(page).to have_content('Comentarios')
    end
end

RSpec.describe 'Users content', type: :system do
    it 'shows the users text' do
        visit users_path
        expect(page).to have_content('Usuarios')
    end
end
RSpec.describe 'Reviews content', type: :system do
    it 'shows the reviews text' do
        visit reviews_path
        expect(page).to have_content('Reseñas')
    end
end

RSpec.describe 'Messages content', type: :system do
    it 'shows the messages text' do
        visit messages_path
        expect(page).to have_content('Mensajes')
    end
end

RSpec.describe 'Requests content', type: :system do
    it 'shows the requests text' do
        visit requests_path
        expect(page).to have_content('Solicitudes')
    end
end

=begin
RSpec.describe 'Welcome content', type: :system do
    it 'shows the welcome text' do
        visit home_home_path
        expect(page).to have_content('Raimundo')
        expect(page).to have_content('Ignacio')
        expect(page).to have_content('Renata')
    end
=end