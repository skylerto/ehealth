describe Ehealth::Physicians do
  it 'should create an empty array of physicians' do
    phys = Ehealth::Physicians.new
    expect(phys.physicians).to eq([])
  end

  describe '#add' do
    it 'should add a physcian' do
      phy = Ehealth::Physician.new(0, 'house', 'specialist')
      phys = Ehealth::Physicians.new
      phys.add(phy)
      expect(phys.physicians.size).to eq(1)
      expect(phys.physicians.first).to eq(phy)
    end

    it 'should not add an id that already exists' do
      
      phy1 = Ehealth::Physician.new(0, 'house', 'specialist')
      phys = Ehealth::Physicians.new
      phys.add(phy1)

      phy = Ehealth::Physician.new(0, 'house', 'specialist')

      expect {phys.add(phy)}.to raise_error(PhysicianIdExistsError)

      expect(phys.physicians.size).to eq(1)
      expect(phys.physicians.first).to eq(phy1)
    end
  end

  describe '#to_s' do
    it 'should format properly' do
      phys = Ehealth::Physicians.new
      phy = Ehealth::Physician.new(0, 'House', 'generalist')
      phys.add(phy)
      phy = Ehealth::Physician.new(1, 'Cameron', 'specialist')
      phys.add(phy)

      out = "[ 0: House - generalist, 1: Cameron - specialist ]"
      expect(phys.to_s).to eq(out)
    end
  end
end
