describe Ehealth::Patient do
  it 'should create a new patient with the given name and id' do
    pat = Ehealth::Patient.new(0, "Patrisha")
    expect(pat.name).to eq("Patrisha")
    expect(pat.id).to eq(0)
  end

  it 'should throw and error if id < 0' do
    expect {
      Ehealth::Patient.new(-1, "Patrisha")
    }.to raise_error(InvalidPatientIdError)
  end
  describe '#to_s' do
    it 'should format patient correctly' do
      pat = Ehealth::Patient.new(0, "Patrisha")
      out = "0: Patrisha"
      expect(pat.to_s).to eq(out)
    end
  end
end
