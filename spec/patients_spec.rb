describe Ehealth::Patients do
  it 'should create an empty array of patients' do
    patients = Ehealth::Patients.new
    expect(patients.patients).to eq([])
  end

  describe '#add' do
    before :each do
      @patients = Ehealth::Patients.new
    end

    it 'should add a patient' do
      patient = Ehealth::Patient.new(0, 'Meri')
      @patients.add(patient)
      expect(@patients.patients.first).to eq(patient)
    end

    it 'should not add a patient with the same id' do
      patient = Ehealth::Patient.new(0, 'Meri')
      @patients.add(patient)
      expect(@patients.patients.first).to eq(patient)

      patient = Ehealth::Patient.new(0, 'Meri')
      expect {@patients.add(patient)}.to raise_error(PatientIdExistsError)

      expect(@patients.patients.size).to eq(1)
    end
  end

  describe '#to_s' do
    it 'should format output' do
      patients = Ehealth::Patients.new
      patient = Ehealth::Patient.new(0, 'Meri')
      patients.add(patient)
      patient = Ehealth::Patient.new(1, 'Sky')
      patients.add(patient)

      out = "[ 0: Meri, 1: Sky ]"
      expect(patients.to_s).to eq(out)
    end
  end
end
