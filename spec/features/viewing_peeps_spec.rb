feature 'Viewing past peeps' do
  scenario 'allows user to view peeps' do
    visit('/')
    click_button('FEED')
    expect(page).to have_content([])
  end

  scenario 'allows user to view peeps, peeps added' do
    visit('/')
    fill_in('content', with: 'abc')
    click_button('Submit')
    click_button('FEED')
    expect(page).to have_content([{:content=>"abc", :name=>"H"}])
  end
end
