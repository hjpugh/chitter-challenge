require 'peep'

describe Peep do
  let(:mock_user) { double :user, name: 'Mr A', user_name: 'aman' }
  let(:mock_peep) { described_class.create(user: mock_user, content: 'abc') }
  let(:mock_peep2) { described_class.create(user: mock_user, content: 'abc', date_posted: '04/02/17 - 12:34') }

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

    it 'does not add peep if not logged in' do
      expect(Peep.create(user: nil, content: 'abc')).to be nil
    end 
  end

  describe '.feed' do
    it 'returns peeps in reverse chronological order' do
      expect(Peep.feed).to eq(Peep.feed.sort_by { |peep| peep[:date_posted] }.reverse)
    end
  end
end   
