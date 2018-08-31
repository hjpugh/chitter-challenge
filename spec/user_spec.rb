require 'user'

describe User do
  mock_user = User.new('Bob B', 'bobb', 'bob@bob.co.uk')
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

  describe '#post' do
    it 'adds a peep to the database' do
      mock_user.post
      expect(Peep.all.empty?).to be false
    end
  end
end
