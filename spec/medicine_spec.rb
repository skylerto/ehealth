describe Ehealth::Medicine do
  it 'should create a new medicine' do
      med = Ehealth::Medicine.new(0, 'Wolfarine')
      expect(med.id).to eq(0)
      expect(med.name).to eq('Wolfarine')
  end

  it 'should not create a medicine with a negative id' do
    expect {
      Ehealth::Medicine.new(-1, 'Wolfarine')
    }.to raise_error(InvalidMedicineIdError)
  end

  describe '#to_s' do
    it 'should format output correctly' do
      out = "0: Wolfarine"
      med = Ehealth::Medicine.new(0, 'Wolfarine')
      expect(med.to_s).to eq(out)
    end
  end

  describe '#interacts_with?' do
    it 'should say yes' do
      
    end
  end

  describe '#add_interaction' do
    it 'should start with no interactions' do
      med = Ehealth::Medicine.new(0, 'advil')
      expect(med.interactions).to eq([])
    end

    it 'should add an interaction' do
      m1 = Ehealth::Medicine.new(0, 'advil')

      m2 = Ehealth::Medicine.new(1, 'alcohol')

      m1.add_interaction(m2)
      m2.add_interaction(m1)

      expect(m1.interactions).to eq([m2])
      expect(m2.interactions).to eq([m1])

    end

    it 'should should raise error if interaction exists' do
      m1 = Ehealth::Medicine.new(0, 'advil')

      m2 = Ehealth::Medicine.new(1, 'alcohol')

      m1.add_interaction(m2)
      m2.add_interaction(m1)

      expect {
        m1.add_interaction(m2)
      }.to raise_error(InteractionExistsError)
    end

  end
end
