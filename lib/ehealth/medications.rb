module Ehealth
  class Medications
    attr_accessor :medications

    def initialize
      @medications = []
    end

    def add(medicine)
      if has_id?(medicine.id)
        raise MedicationsIdExistsError.new 'medication id already in use'
      elsif has_name?(medicine.name)
        raise MedicationsNameExistsError.new 'medication name already in use'
      end

      @medications << medicine
    end

    def to_s
      out = "[ "
      @medications.each_with_index { |med, i|
        out << med.to_s
        out << ", " unless i == @medications.size - 1
      }
      out << " ]"
    end

    private

    def has_id?(id)
      @medications.select {|med| 
        med.id == id
      }.size > 0 ? true : false
    end

    def has_name?(name)
      @medications.select {|med| 
        med.name == name
      }.size > 0 ? true : false
    end
  end
end

class MedicationsIdExistsError < StandardError

end

class MedicationsNameExistsError < StandardError

end
