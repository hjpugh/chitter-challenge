require './app.rb'

feature 'Home screen' do
  scenario 'user visits home page' do
    visit('/')
    expect(page).to have_content('Hello')
  end
end
