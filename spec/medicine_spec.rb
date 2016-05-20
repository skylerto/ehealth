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
end
