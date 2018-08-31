require 'peep'

describe Peep do
  let(:mock_user) { double :user, name: 'Mr A', user_name: 'aman' }
  let(:mock_peep) { described_class.create(user: mock_user, content: 'abc') }

  it 'lets users know the time it was posted' do
    t = Time.now.strftime('%D - %H:%M')
    expect(mock_peep.date_posted).to eq(t)
  end

  it 'lets users know who posted it - actual name' do
    expect(mock_peep.name).to eq('Mr A')
  end

  it 'lets users know who posted it - user_name' do
    expect(mock_peep.user_name).to eq('aman')
  end

  describe '.create' do
    it 'adds a peep to the database' do
      Peep.create(user: mock_user, content: 'abc')
      expect(Peep.all.empty?).to be false
    end
  end
end   
