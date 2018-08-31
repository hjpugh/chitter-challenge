require 'peep_feed'

describe PeepFeed do
  it 'displays a list of peeps' do
    expect(PeepFeed.feed).to eq([])
  end
end
