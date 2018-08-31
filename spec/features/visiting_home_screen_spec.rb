require './app.rb'

feature 'Home screen' do
  scenario 'user visits home page' do
    visit('/')
    expect(page).to have_content('Hello')
  end

  scenario 'allows user to submit new peep' do
    visit('/')
    fill_in('content', with: 'abc')
    expect(current_path).to eq('/')
  end
end
