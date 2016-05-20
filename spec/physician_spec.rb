describe Ehealth::Physician do
  it 'should create a new Physician' do
    physician = Ehealth::Physician.new(0, 'House', 'specialist')
    expect(physician.id).to eq(0)
    expect(physician.name).to eq('House')
    expect(physician.type).to eq('specialist')
  end

  it 'should not create a physician with id < 0' do
    expect {
      Ehealth::Physician.new(-1, 'House', 'specialist')
    }.to raise_error(InvalidPhysicianIdError)
  end

  it 'should not create a doctor which is not a generalist or a specialist' do
    expect {
      Ehealth::Physician.new(0, 'House', 'sp')
    }.to raise_error(InvalidPhysicianTypeError)
  end

  describe '#to_s' do
    it 'should format output correctly' do
      physician = Ehealth::Physician.new(0, 'House', 'specialist')
      out = "0: House - specialist"
      expect(physician.to_s).to eq(out)
    end
  end
end
