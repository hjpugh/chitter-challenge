feature 'Users can post new peeps' do
  scenario 'User posts' do
    visit('/')
    fill_in('content', with: 'abc')
    click_button
    expect(current_path).to eq('/')
  end
end
