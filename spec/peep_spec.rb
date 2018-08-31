require 'peep'

describe Peep do
  let(:mock_user) { double :user, name: 'Mr A', user_name: 'aman' }
  let(:mock_peep) { described_class.new(mock_user) }

  it 'lets users know the time it was posted' do
    t = Time.now.strftime('%H:%M')
    expect(mock_peep.time_posted).to eq(t)
  end

  it 'lets users know who posted it - actual name' do
    expect(mock_peep.user).to eq('Mr A')
  end

  it 'lets users know who posted it - user_name' do
    expect(mock_peep.user_name).to eq('aman')
  end
end   
