feature 'Viewing past peeps' do
  scenario 'allows user to view peeps' do
    visit('/')
    sign_up
    sign_in
    fill_in('content', with: 'abc')
    click_button('Submit')
    click_button('FEED')
    expect(page).to have_content('abc')
  end
end
