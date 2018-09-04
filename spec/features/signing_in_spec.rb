feature 'Allows users to sign in' do
  scenario 'user signs up & signs in' do
    sign_up
    fill_in('user_name', with: 'XX')
    fill_in('password', with: 'XX')
    click_button('Log in')
    expect(page).to have_content('Login successful')
  end
end
