describe Ehealth::Prescription do
  it 'should create a new prescription' do
    pat = Ehealth::Patient.new(0, 'Meri')
    med = Ehealth::Medicine.new(0, 'Advil')
    doc = Ehealth::Physician.new(0, 'house', 'generalist')
    pres = Ehealth::Prescription.new(pat, med, doc)

    expect(pres.patient).to eq(pat)
    expect(pres.medication).to eq(med)
    expect(pres.physician).to eq(doc)
  end
end
