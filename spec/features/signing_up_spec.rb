feature 'Allows users to sign up' do
  let(:mock_user) { double :user, name: 'H', user_name: 'hjp', password: 'abc123' }

  scenario 'user signs up' do
    visit('/')
    click_button('Sign Up')
    fill_in('name', with: 'H')
    fill_in('user_name', with: 'hjp')
    fill_in('password', with: 'abc123')
    expect(User.all.empty?).to be false
  end
end
