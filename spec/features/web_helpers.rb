def sign_up
  visit('/')
  click_button('Sign Up')
  fill_in('name', with: 'XX')
  fill_in('user_name', with: 'XX')
  fill_in('email', with: 'XX')
  fill_in('password', with: 'XX')
  click_button('Submit')
end

def sign_in
  fill_in('user_name', with: 'XX')
  fill_in('password', with: 'XX')
  click_button('Log in')
end
