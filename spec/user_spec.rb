require 'user'

describe User do
  mock_user = User.new('Bob B', 'bobb', 'bob@bob.co.uk')

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
    it 'allows the user to post a peep' do
      expect(mock_user.post).to be_a(Peep)
    end

    it 'associates the users real name to the peep' do
      expect(mock_user.post.user).to eq('Bob B')
    end

    it 'associates the users user_name to the peep' do
      expect(mock_user.post.user_name).to eq('bobb')
    end
  end
end
