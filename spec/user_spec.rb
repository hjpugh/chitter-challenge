require 'user'

describe User do
  mock_user = User.new(id: 1, name: 'Bob B', user_name: 'bobb', email: 'bob@bob.co.uk', password: 'hello')
  mock_post = mock_user.post(content: 'abc')

  it 'has a real name' do
    expect(mock_user.name).to eq('Bob B')
  end

  it 'has a user name' do
    expect(mock_user.user_name).to eq('bobb')
  end

  it 'has an email address' do
    expect(mock_user.email).to eq('bob@bob.co.uk')
  end

  describe '.sign_up' do
    it 'adds a new user to the database' do
      User.sign_up(name: 'H', user_name: 'hjp123', email: 'hjp@gmail..com', password: 'hjp')
      (expect !!(User.return_user('hjp123'))).to be true
    end
  end

  describe '#post' do
    it 'adds a peep to the database' do
      mock_user.post
      expect(Peep.all.empty?).to be false
    end
  end
end
