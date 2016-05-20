module Ehealth
  class Interactions

    attr_accessor :interactions

    def initialize
      @interactions = []
    end

    def add_interaction(medicine1, medicine2)
      medicine1.add_interaction(medicine2)
      medicine2.add_interaction(medicine1)
      @interactions << [medicine1, medicine2]
    end
  
    def to_s
      out = "[ "
      @interactions.each_with_index { |interaction, i|
        meds = Ehealth::Medications.new
        interaction.each { |med|
          meds.add(med)
        }
        out << meds.to_s
        out << ", " unless i == @interactions.size - 1
      }
      out << " ]"
    end
  end
end
