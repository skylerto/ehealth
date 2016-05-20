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
end
