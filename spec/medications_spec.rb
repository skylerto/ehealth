describe Ehealth::Medications do
  it 'should create new empty array' do
    meds = Ehealth::Medications.new
    expect(meds.medications).to eq([])
  end

  describe '#add' do
    it 'should add a new medication' do
      med = Ehealth::Medicine.new(0, 'Advil')
      meds = Ehealth::Medications.new
      meds.add(med)

      expect(meds.medications.size).to eq(1)
      expect(meds.medications.first).to eq(med)
    end

    it 'should not add a medication with the same id' do
      meds = Ehealth::Medications.new
      med1 = Ehealth::Medicine.new(0, 'Advil')
      meds.add(med1)

      med = Ehealth::Medicine.new(0, 'Tylenol')

      expect {meds.add(med)}.to raise_error(MedicationsIdExistsError)
    end

    it 'should not add a medication with the same name' do
      meds = Ehealth::Medications.new
      med1 = Ehealth::Medicine.new(0, 'Advil')
      meds.add(med1)

      med = Ehealth::Medicine.new(1, 'Advil')

      expect {meds.add(med)}.to raise_error(MedicationsNameExistsError)
    end
  end

  describe '#to_s' do
    it 'should format output properly' do
      out = "[ 0: Advil, 1: Tylenol ]"
      meds = Ehealth::Medications.new
      med = Ehealth::Medicine.new(0, 'Advil')
      meds.add(med)
      med = Ehealth::Medicine.new(1, 'Tylenol')
      meds.add(med)

      expect(meds.to_s).to eq(out)
    end
  end

  describe '#medicine' do
    it 'it should grab a medicine by id' do
      med = Ehealth::Medicine.new(0, 'Advil')
      meds = Ehealth::Medications.new
      meds.add(med)

      m = meds.medicine(0)
      expect(m).to eq(med)
    end

    it 'should grab a medicine by name' do
      med = Ehealth::Medicine.new(0, 'Advil')
      meds = Ehealth::Medications.new
      meds.add(med)

      m = meds.medicine('Advil')
      expect(m).to eq(med)
    end
  end
end
