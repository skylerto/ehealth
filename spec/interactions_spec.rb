describe Ehealth::Interactions do
  it 'should create a new interaction between 2 medications' do
    m1 = Ehealth::Medicine.new(0, 'advil')
    m2 = Ehealth::Medicine.new(1, 'alcohol')

    interaction = Ehealth::Interactions.new
    interaction.add_interaction(m1, m2)

    expect(interaction.interactions).to eq([[m1,m2]])

  end

  it 'should format properly' do
    m1 = Ehealth::Medicine.new(0, 'advil')
    m2 = Ehealth::Medicine.new(1, 'alcohol')

    interaction = Ehealth::Interactions.new
    interaction.add_interaction(m1, m2)

    out = "[ [ 0: advil, 1: alcohol ] ]"
    
    expect(interaction.to_s).to eq(out)
  end
end
