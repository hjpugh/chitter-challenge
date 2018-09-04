feature 'Users can post new peeps' do
  scenario 'User posts' do
    visit('/')
    sign_up
    sign_in
    fill_in('content', with: 'abc')
    click_button('Submit')
    expect(current_path).to eq('/')
  end
end
